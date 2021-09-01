import 'dart:convert';

import 'package:aipetto/modules/businessServicesTypes/models/business_services_type.dart';
import 'package:flutter/material.dart';
import 'package:aipetto/config/environment.dart';
import 'package:aipetto/config/pref_manager.dart';
import 'package:meta/meta.dart';
import 'package:http/http.dart' as http;

class BusinessServicesTypesApiClient {
  final _baseUrl = Environment.aipettoCoreApi;
  final http.Client httpClient;

  // TODO Refactor to apply better solution and not hard coded, only for MVP.
  final languageId = Prefs.getString(Prefs.LANGUAGE_ID) ?? '6096a50fb57043bb3ae7b537';

  BusinessServicesTypesApiClient({
    @required this.httpClient,
  }) : assert(httpClient != null);

  Future<BusinessServiceType> fetchPetTypes() async {

    final url = '$_baseUrl/business-services-types?filter%5Blanguage%5D=$languageId';
    final response = await this.httpClient.get(url);

    if( response.statusCode != 200 ){
      throw new Exception('Error gettings pet types');
    }

    final json = jsonDecode(response.body);
    return BusinessServiceType.fromJson(json);
  }
}
