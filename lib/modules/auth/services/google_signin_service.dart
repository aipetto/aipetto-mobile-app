import 'dart:convert';

import 'package:google_sign_in/google_sign_in.dart';
import 'package:aipetto/config/environment.dart';
import 'package:http/http.dart' as http;

class GoogleSignInService {

  static GoogleSignIn _googleSignIn = GoogleSignIn(
    // With this scope it allows us have name, email and profile photo
    scopes: <String>[
      'email',
    ],
  );

  static Future signInWithGoogle() async {
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

  static Future signOut() async {
    await _googleSignIn.signOut();
  }
}