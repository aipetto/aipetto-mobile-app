import 'dart:convert';

import 'package:aipetto/config/environment.dart';
import 'package:aipetto/config/storage/secure_storage.dart';
import 'package:aipetto/modules/businessServiceAvailability/models/service_availabilities.dart';
import 'package:aipetto/modules/businessServicesTypes/models/business_services_type.dart';
import 'package:http/http.dart' as http;

abstract class ServiceAvailabilityOperations {
  Future<List<ServiceAvailability>> getAvailabilityForServiceRegisteredToBusiness(
      BusinessServiceType serviceId,
      String businessTenant,
      String businessId
   );
}

class ServiceAvailabilityApiClient implements ServiceAvailabilityOperations {
  final _baseUrl = Environment.aipettoCoreApi;
  final SecureStorage secureStorageRepository = SecureStorage();
  final http.Client httpClient;

  ServiceAvailabilityApiClient(this.httpClient);

  @override
  Future<List<ServiceAvailability>> getAvailabilityForServiceRegisteredToBusiness(BusinessServiceType serviceId, String businessTenant, String businessId) async {
    final jwtOnSecureStorage = await secureStorageRepository.getToken();

    final url = '$_baseUrl/tenant/:tenantId/business-place-service-availability?filter%5BserviceType%5D=$serviceId&filter%5BbusinessId%5D=$businessId';
    final availabilityResponse = await this.httpClient.get(url, headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer ${jwtOnSecureStorage}',
    });

    if(availabilityResponse.statusCode != 200) {
      throw new Exception('Error get the availability for service');
    }

    final json = jsonDecode(availabilityResponse.body);
    return ServiceAvailabilities.fromJson(json).rows;
  }

}

