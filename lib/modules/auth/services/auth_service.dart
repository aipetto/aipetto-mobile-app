import 'dart:convert';

import 'package:aipetto/config/environment.dart';
import 'package:aipetto/config/storage/secure_storage.dart';
import 'package:aipetto/modules/user/models/user.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:http/http.dart' as http;
import 'package:uuid/uuid.dart';

abstract class AuthenticationService {
  Future<User> getCurrentUser();
  Future<User> signInWithEmailAndPassword(String email, String password);
  Future<User> signInWithGoogle();
  Future<void> signOut();
}

class AipettoCoreAuthenticationService extends AuthenticationService {
  final _baseUrl = Environment.aipettoCoreApi;
  final http.Client httpClient;

  AipettoCoreAuthenticationService({required this.httpClient})
      : assert(httpClient != null);

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

    final getJwtResponse = await this.httpClient.post(
        Uri.parse('$_baseUrl/auth/sign-in'),
        body: jsonEncode(authData),
        headers: {'Content-type': 'application/json'});

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
    throw new Exception('Error fetch user with auth email and password');
  }

  GoogleSignIn _googleSignIn = GoogleSignIn(
    // With this scope it allows us have name, email and profile photo
    scopes: <String>[
      'email',
    ],
  );

  Future<User> signInWithGoogle() async {
    try {
      final SecureStorage secureStorageRepository = new SecureStorage();
      final GoogleSignInAccount? account = await _googleSignIn.signIn();
      final googleKey = await account?.authentication;

      final getJwtResponse = await http.post(
          Uri.parse('$_baseUrl/auth/mobile/google'),
          body: {'token': googleKey?.idToken});

      if (getJwtResponse.statusCode == 200) {
        await secureStorageRepository.persistToken(getJwtResponse.body);

        final userResp =
            await http.get(Uri.parse('$_baseUrl/auth/me'), headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'Authorization': 'Bearer ${getJwtResponse.body}',
        });

        if (userResp.statusCode == 200) {
          final userDTOFromResponse = userFromJson(userResp.body);

          final jwtOnSecureStorage = await secureStorageRepository.getToken();
          var uuid = Uuid();

          if (userDTOFromResponse.tenants!.isEmpty) {
            final newTenantName = {
              'data': {'name': 'aipetto' + uuid.v4()}
            };
            // Create random tenant and role petOwner for users signed in via Google Sign
            await this.httpClient.post(Uri.parse('$_baseUrl/tenant'),
                body: jsonEncode(newTenantName),
                headers: {
                  'Content-Type': 'application/json',
                  'Accept': 'application/json',
                  'Authorization': 'Bearer ${jwtOnSecureStorage}'
                });
          }
          return userDTOFromResponse;
        }
      }
      throw new Exception('Error fetch user with Google Sign In');
    } catch (e) {
      print('Error Google Sign in');
      print(e);
      throw new Exception('Error fetch user with Google Sign In');
    }
  }

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
    throw new Exception('Error fetch user with Google Sign In');
  }

  @override
  Future<void> signOut() async {
    await _googleSignIn.signOut();
    final SecureStorage secureStorageRepository = new SecureStorage();
    await secureStorageRepository.deleteToken();
  }
}
