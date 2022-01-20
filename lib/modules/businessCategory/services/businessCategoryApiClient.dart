import 'package:aipetto/config/environment.dart';
import 'package:aipetto/config/pref_manager.dart';
import 'package:aipetto/modules/businessCategory/models/business_category.dart';
import 'package:http/http.dart' as http;

class BusinessCategoryApiClient {
  final _baseUrl = Environment.aipettoCoreApi;
  final http.Client httpClient;
  final languageId = Prefs.getString(Prefs.LANGUAGE_ID);

  BusinessCategoryApiClient({
    required this.httpClient,
  }) : assert(httpClient != null);

  Future<BusinessCategory?> fetchPetBusinessCategory() async {
    final url =
        '$_baseUrl/business-category/autocomplete?query%5Blanguage%5D=$languageId';
  }
}
