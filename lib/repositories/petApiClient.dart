import 'package:aipetto/config/environment.dart';
import 'package:aipetto/data/pref_manager.dart';
import 'package:aipetto/model/models.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

class petApiClient {
  final _baseUrl = Environment.aipettoCoreApi;
  final http.Client httpClient;
  final languageId = Prefs.getString(Prefs.LANGUAGE_ID);

  petApiClient({
    @required this.httpClient,
  }) : assert(httpClient != null);

  // TODO need tenant information from UserApiClient and is a state in UserBloc
  Future<Pet> fetchUserPets() async {
    //https://aipetto-312421-sjvjr4rqhq-rj.a.run.app/api/tenant/606c9c61826963485fbde0ed/pets TODO check correct endpoint and test via openapi
    final url = '$_baseUrl/...';

  }
}

