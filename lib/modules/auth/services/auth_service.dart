import 'dart:convert';

import 'package:aipetto/config/environment.dart';
import 'package:aipetto/config/storage/secure_storage.dart';
import 'package:aipetto/modules/user/models/user.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
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

  GoogleSignIn _googleSignIn = GoogleSignIn(
    // With this scope it allows us have name, email and profile photo
    scopes: <String>[
      'email',
    ],
  );

  Future signInWithGoogle() async {
    final _baseUrl = Environment.aipettoCoreApi;
    final _baseHost = Environment.aipettoCoreHost;

    try{
      final GoogleSignInAccount account = await _googleSignIn.signIn();
      final googleKey = await account.authentication;

      final signInWithGoogleEndpoint = Uri(
          scheme: 'http',
          host: '$_baseHost',
          path: '/api/auth/mobile/google'
      );

      final googleTokenJson = {
        'token': googleKey.idToken
      };

      return await http.post(Uri.parse('$_baseUrl/auth/mobile/google'),
          body: jsonEncode(googleTokenJson),
          headers: {
            'Content-type': 'application/json'
          }
      );
    } catch (e) {
      print('Error Google Sign in');
      print(e);
      return null;
    }
  }

  @override
  Future<void> signOut() async {
    await _googleSignIn.signOut();
    final SecureStorage secureStorageRepository = new SecureStorage();
    await secureStorageRepository.deleteToken();
  }
}