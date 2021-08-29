import 'dart:convert';

import 'package:aipetto/config/environment.dart';
import 'package:aipetto/model/user/user.dart';
import 'package:aipetto/storage/secure_storage.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

abstract class AuthenticationService {
  Future<User> getCurrentUser();
  Future<User> signInWithEmailAndPassword(String email, String password);
  Future<void> signOut();
}

class AipettoCoreAuthenticationService extends AuthenticationService {
  final _baseUrl = Environment.aipettoCoreApi;
  final http.Client httpClient;

  AipettoCoreAuthenticationService({ @required this.httpClient})
      : assert(httpClient != null);

  @override
  Future<User> getCurrentUser() async {
    // TODO Refactor extracting secureStorage instantiation here but injecting from out of authentication service class
    final SecureStorage secureStorageRepository = new SecureStorage();
    final jwtOnSecureStorage = await secureStorageRepository.getToken();

    final resp = await http.get(Uri.parse('$_baseUrl/auth/me'), headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer ${jwtOnSecureStorage}',
    });

    if (resp.statusCode == 200) {
      return userFromJson(resp.body);
    }
    return null;
  }

  @override
  Future<User> signInWithEmailAndPassword(String email, String password) async {
    // TODO Refactor extracting secureStorage instantiation here but injecting from out of authentication service class
    final SecureStorage secureStorageRepository = new SecureStorage();

    final authData = {
      'email': email,
      'password': password,
      'invitationToken': "",
      'tenantId': ""
    };

    final getJwtResponse = await this.httpClient.post(Uri.parse('$_baseUrl/auth/sign-in'),
        body: jsonEncode(authData),
        headers: {
          'Content-type': 'application/json'
        }
    );

    if (getJwtResponse.statusCode == 200) {
      await secureStorageRepository.persistToken(getJwtResponse.body);

      final userResp = await http.get(Uri.parse('$_baseUrl/auth/me'), headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer ${getJwtResponse.body}',
      });

      if (userResp.statusCode == 200) {
        return userFromJson(userResp.body);
      }
    }
    return null;
  }

  @override
  Future<void> signOut() async {
    // TODO Refactor extracting secureStorage instantiation here but injecting from out of authentication service class
    final SecureStorage secureStorageRepository = new SecureStorage();
    await secureStorageRepository.deleteToken();
  }
}