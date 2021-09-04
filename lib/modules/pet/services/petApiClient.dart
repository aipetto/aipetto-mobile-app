import 'dart:convert';

import 'package:aipetto/config/environment.dart';
import 'package:aipetto/config/pref_manager.dart';
import 'package:aipetto/modules/pet/models/pet.dart';
import 'package:aipetto/modules/user/models/user.dart';
import 'package:meta/meta.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

class PetApiClient {
  final _baseUrl = Environment.aipettoCoreApi;
  final http.Client httpClient;
  final languageId = Prefs.getString(Prefs.LANGUAGE_ID);

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

  Future<Pet> updatePet(Pet petInfoToUpdate, TenantElement tenant) async {

    /**final pet = {
      'email': email,
      'password': password,
      'invitationToken': "",
      'tenantId': ""
    };**/

    final petUpdatedResponse = await this.httpClient.put(Uri.parse('$_baseUrl/tenant/:tenantId/pet/:id?filter%5Blanguage%5D=$languageId'),
        body: jsonEncode(petInfoToUpdate),
        headers: {
          'Content-type': 'application/json'
        }
    );

    if( petUpdatedResponse.statusCode != 200 ){
      throw new Exception('Error updating pet');
    }

    final json = jsonDecode(petUpdatedResponse.body);
    return Pet.fromJson(json);
  }
}

