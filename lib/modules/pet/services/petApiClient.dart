import 'dart:convert';

import 'package:aipetto/config/environment.dart';
import 'package:aipetto/config/pref_manager.dart';
import 'package:aipetto/config/storage/secure_storage.dart';
import 'package:aipetto/modules/pet/models/pet.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:meta/meta.dart';

class PetApiClient {
  final _baseUrl = Environment.aipettoCoreApi;
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


  Future<Pet> addPet(Pet pet) async {

    final jwtOnSecureStorage = await secureStorageRepository.getToken();
    final petTenant = pet.tenant;
    final newPetInfo = {
      'data': {
        "name": pet.name,
        "isLookingForMatch": pet.isLookingForMatch,
        "tenant": pet.tenant,
        "createdBy": pet.createdBy,
        "updatedBy": pet.updatedBy
      }
    };

    final petUpdatedResponse = await this.httpClient.post(Uri.parse('$_baseUrl/tenant/$petTenant/petWithTenant'),
        body: jsonEncode(newPetInfo),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'Authorization': 'Bearer ${jwtOnSecureStorage}',
        }
    );

    if( petUpdatedResponse.statusCode != 200 ){ throw new Exception('Error updating pet'); }

    final json = jsonDecode(petUpdatedResponse.body);
    return Pet.fromJson(json);
  }
}

