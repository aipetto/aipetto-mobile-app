import 'package:aipetto/config/environment.dart';
import 'package:aipetto/model/models.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

class UserApiClient {
  final _baseUrl = Environment.aipettoCoreApi;
  final http.Client httpClient;

  UserApiClient({
    @required this.httpClient,
  }) : assert(httpClient != null);


  Future<User> auth() async {
    final url = '$_baseUrl/auth/sign-in';
    final authMeUrl = '$_baseUrl/auth/me';
  }
}

