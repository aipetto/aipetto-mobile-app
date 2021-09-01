import 'dart:io';

class Environment {
  static String localCoreApi    = Platform.isAndroid ? 'http://0.0.0.0:8080/api' : 'http://localhost:8080/api';
  static String localCoreHost    = Platform.isAndroid ? 'localhost:8080' : 'localhost:8080';
  static String socketUrl       = Platform.isAndroid ? 'http://0.0.0.0:8080' : 'http://localhost:8080';
  static String aipettoCoreApi  = Platform.isAndroid ? 'https://aipetto-312421-sjvjr4rqhq-rj.a.run.app/api' : 'https://aipetto-312421-sjvjr4rqhq-rj.a.run.app/api';
  static String aipettoCoreHost  = Platform.isAndroid ? 'aipetto-312421-sjvjr4rqhq-rj.a.run.app' : 'aipetto-312421-sjvjr4rqhq-rj.a.run.app';
}