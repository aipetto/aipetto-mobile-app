import 'dart:convert';

import 'package:aipetto/config/environment.dart';
import 'package:http/http.dart' as http;

class AuthService{

 Future login(String email, String password) async {

   final data = {
     "email": email,
     "password": password,
     "invitationToken": "",
     "tenantId": ""
   };

  final resp = await http.post('${Environment.apiUrl}/auth/sign-in',
        body: jsonEncode(data),
        headers: {
          'Content-Type': 'application/json'
        }
  );

  print( resp.body );
 }
}