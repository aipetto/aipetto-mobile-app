import 'dart:convert';

import 'package:aipetto/config/environment.dart';
import 'package:aipetto/config/storage/secure_storage.dart';
import 'package:aipetto/modules/businessServicePrice/models/business_service_prices.dart';
import 'package:http/http.dart' as http;

class BusinessServicesPricesApiClient {
  final _baseUrl = Environment.aipettoCoreApi;
  final SecureStorage secureStorageRepository = SecureStorage();
  final http.Client httpClient;

  BusinessServicesPricesApiClient({
    required this.httpClient,
  }) : assert(httpClient != null);

  Future<List<BusinessServicePrice>?> fetchBusinessServicesPrices(String? businessTenant) async {

    final url = '$_baseUrl/tenant/$businessTenant/business-services-prices?offset=0&limit=10&orderBy=createdAt_DESC';
    final businessServicesPricesResponse = await this.httpClient.get(Uri.parse(url), headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
    });

    if(businessServicesPricesResponse.statusCode != 200) {
      throw new Exception('Error getting business services prices');
    }

    final json = jsonDecode(businessServicesPricesResponse.body);
    return BusinessServicePrices.fromJson(json).rows;
  }
}
