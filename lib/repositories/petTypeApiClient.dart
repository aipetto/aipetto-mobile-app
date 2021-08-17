import 'package:aipetto/config/environment.dart';
import 'package:aipetto/data/pref_manager.dart';
import 'package:aipetto/model/models.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

class petTypeApiClient {
  final _baseUrl = Environment.aipettoCoreApi;
  final http.Client httpClient;
  final languageId = Prefs.getString(Prefs.LANGUAGE_ID);

  petTypeApiClient({
    @required this.httpClient,
  }) : assert(httpClient != null);


  Future<PetType> fetchPetTypes() async {
    final url = '$_baseUrl/api/pet-types/autocomplete?query%5Blanguage%5D=$languageId';

  }
}

