import 'dart:convert';

import 'package:aipetto/modules/petType/models/pet_type.dart';
import 'package:flutter/material.dart';
import 'package:aipetto/config/environment.dart';
import 'package:aipetto/config/pref_manager.dart';
import 'package:meta/meta.dart';
import 'package:http/http.dart' as http;

class PetTypeApiClient {
  final _baseUrl = Environment.aipettoCoreApi;
  final http.Client httpClient;

  // TODO Refactor to apply better solution and not hard coded default value: Portuguese
  final languageId =
      Prefs.getString(Prefs.LANGUAGE_ID) ?? '6096a50ab5704301f1e7b535';

  PetTypeApiClient({
    required this.httpClient,
  }) : assert(httpClient != null);

  Future<PetType> fetchPetTypes() async {
    final url = '$_baseUrl/pet-types?filter%5Blanguage%5D=$languageId';
    final response = await this.httpClient.get(Uri.parse(url));

    if (response.statusCode != 200) {
      throw new Exception('Error gettings pet types');
    }

    final json = jsonDecode(response.body);
    return PetType.fromJson(json);
  }
}
