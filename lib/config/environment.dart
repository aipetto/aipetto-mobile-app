import 'dart:io';

class Environment {
  static String apiUrl = Platform.isAndroid ? 'http://0.0.0.0:8080/api' : 'http://localhost:8080/api';
  static String socketUrl = Platform.isAndroid ? 'http://0.0.0.0:8080' : 'http://localhost:8080';
}