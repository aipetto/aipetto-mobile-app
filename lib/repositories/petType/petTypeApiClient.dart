import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:aipetto/config/environment.dart';
import 'package:aipetto/data/pref_manager.dart';
import 'package:meta/meta.dart';
import 'package:aipetto/model/models.dart';
import 'package:http/http.dart' as http;

class PetTypeApiClient {
  final _baseUrl = Environment.aipettoCoreApi;
  final http.Client httpClient;
  final languageId = Prefs.getString(Prefs.LANGUAGE_ID);

  PetTypeApiClient({
    @required this.httpClient,
  }) : assert(httpClient != null);

  Future<PetType> fetchPetTypes() async {
    final url = '$_baseUrl/pet-types?filter%5Blanguage%5D=$languageId';
    final response = await this.httpClient.get(url);

    if( response.statusCode != 200 ){
      throw new Exception('Error gettings pet types');
    }

    final json = jsonDecode(response.body);
    return PetType.fromJson(json);
  }
}

