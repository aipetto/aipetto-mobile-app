import 'package:aipetto/config/environment.dart';
import 'package:aipetto/data/pref_manager.dart';
import 'package:aipetto/model/models.dart';
import 'package:meta/meta.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

class BusinessCategoryApiClient {
  final _baseUrl = Environment.aipettoCoreApi;
  final http.Client httpClient;
  final languageId = Prefs.getString(Prefs.LANGUAGE_ID);

  BusinessCategoryApiClient({
    @required this.httpClient,
  }) : assert(httpClient != null);


  Future<BusinessCategory> fetchPetBusinessCategory() async {
    final url = '$_baseUrl/business-category/autocomplete?query%5Blanguage%5D=$languageId';


  }
}

