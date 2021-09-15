import 'dart:convert';
import 'dart:io';

import 'package:aipetto/config/environment.dart';
import 'package:aipetto/config/pref_manager.dart';
import 'package:aipetto/config/storage/images_file_storage.dart';
import 'package:aipetto/config/storage/secure_storage.dart';
import 'package:aipetto/modules/pet/models/pet.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:path/path.dart' as p;
import 'package:meta/meta.dart';
import 'package:uuid/uuid.dart';

class PetApiClient {
  final _baseUrl = Environment.aipettoCoreApi;
  final _baseUrlHostOnly = Environment.aipettoCoreHost;
  final http.Client httpClient;
  final languageId = Prefs.getString(Prefs.LANGUAGE_ID);
  final SecureStorage secureStorageRepository = SecureStorage();

  PetApiClient({
    @required this.httpClient,
  }) : assert(httpClient != null);

  Future<Pet> fetchUserPets() async {

    final url = '$_baseUrl/tenant/{tenantId}/pet/{id}?filter%5Blanguage%5D=$languageId';
    final response = await this.httpClient.get(url);

    if( response.statusCode != 200 ){
      throw new Exception('Error gettings pet types');
    }

    final json = jsonDecode(response.body);
    return Pet.fromJson(json);
  }

  Future<Pet> fetchPet(Pet pet, String tenant) async {

    final url = '$_baseUrl/tenant/{tenantId}/pet/{id}';
    final response = await this.httpClient.get(url);

    if( response.statusCode != 200 ){
      throw new Exception('Error gettings pet information');
    }

    final json = jsonDecode(response.body);
    return Pet.fromJson(json);
  }

  Future<Pet> updatePet(Pet petInfoToUpdate, String tenant) async {

    final jwtOnSecureStorage = await secureStorageRepository.getToken();

    final petUpdatedResponse = await this.httpClient.put(Uri.parse('$_baseUrl/tenant/:tenantId/pet/:id'),
        body: jsonEncode(petInfoToUpdate),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'Authorization': 'Bearer ${jwtOnSecureStorage}',
        });

    if( petUpdatedResponse.statusCode != 200 ){ throw new Exception('Error updating pet');}

    final json = jsonDecode(petUpdatedResponse.body);
    return Pet.fromJson(json);
  }


  Future<Pet> addPet(Pet pet, File profileImage) async {

    final jwtOnSecureStorage = await secureStorageRepository.getToken();
    final petTenant = pet.tenant;

    List<ProfileImage> imageMultipartUploaded = await uploadMultipartImageToCloudStorage(
        profileImage,
        pet,
        petTenant,
        jwtOnSecureStorage
    );

    final newPetInfo = {
      'data': {
        "name": pet.name,
        "isLookingForMatch": pet.isLookingForMatch,
        "profileImage": imageMultipartUploaded ?? [],
        "tenant": pet.tenant,
        "createdBy": pet.createdBy,
        "updatedBy": pet.updatedBy
      }
    };

    final petUpdatedResponse = await this.httpClient.post(Uri.parse('$_baseUrl/tenant/$petTenant/pet'),
        body: jsonEncode(newPetInfo),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'Authorization': 'Bearer ${jwtOnSecureStorage}',
        }
    );

    if( petUpdatedResponse.statusCode != 200 ){ throw new Exception('Error adding pet'); }

    final json = jsonDecode(petUpdatedResponse.body);
    return Pet.fromJson(json);
  }

  Future<List<ProfileImage>> uploadMultipartImageToCloudStorage(File profileImage, Pet pet, String petTenant, String jwtOnSecureStorage) async {
     var uuid = Uuid().v4();
    var extension = p.extension(profileImage.path);
    var filename = uuid + extension;
    
    final queryParameters =  {
        'filename': filename,
        'storageId': ImagesFileStorage.petProfileImage["id"],
        'currentUserId': pet.createdBy,
        'currentTenantId': pet.tenant
    };
    
    final uri = Uri.https('$_baseUrlHostOnly', 'api/tenant/$petTenant/file/credentials', queryParameters);
    final fileCredentials = await this.httpClient.get(uri, headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer ${jwtOnSecureStorage}'
    });
    final jsonResponseFileCredentials = jsonDecode(fileCredentials.body);
    
    // TODO upload image to server - REFACTOR and extract to own method
    final imageUploadRequest = http.MultipartRequest('POST', Uri.parse(jsonResponseFileCredentials['uploadCredentials']['url']));
    
    jsonResponseFileCredentials['uploadCredentials']['fields'].forEach((k, v) => {
      imageUploadRequest.fields[k] = v
    });
    
    final file = await http.MultipartFile.fromPath('file', profileImage.path);
    imageUploadRequest.files.add(file);
    
    final streamResponse = await imageUploadRequest.send();
    
    await http.Response.fromStream(streamResponse);
    
    final List<ProfileImage> imageMultipartUploaded = [ new ProfileImage(
       id: uuid,
       name: profileImage.path.split('/').last,  //file.name,
       sizeInBytes: profileImage.readAsBytesSync().lengthInBytes, //file.size,
       publicUrl: jsonResponseFileCredentials['uploadCredentials']['publicUrl'] ?? null,
       privateUrl: jsonResponseFileCredentials['privateUrl'],
       downloadUrl: jsonResponseFileCredentials['downloadUrl'],
       createdAt: DateTime.now(),
       updatedAt: DateTime.now(),
    )];
    return imageMultipartUploaded;
  }
}
