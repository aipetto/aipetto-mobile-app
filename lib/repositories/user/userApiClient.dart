import 'package:aipetto/config/environment.dart';
import 'package:aipetto/data/pref_manager.dart';
import 'package:aipetto/model/models.dart';
import 'package:meta/meta.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

class UserApiClient {
    final _baseUrl = Environment.aipettoCoreApi;
    final http.Client httpClient;
    final languageId = Prefs.getString(Prefs.LANGUAGE_ID);

    UserApiClient({
      @required this.httpClient,
    }) : assert(httpClient != null);


   Future<User> auth() async {
     final url = '$_baseUrl/auth/sign-in';
     final authMeUrl = '$_baseUrl/auth/me';



   }
}

