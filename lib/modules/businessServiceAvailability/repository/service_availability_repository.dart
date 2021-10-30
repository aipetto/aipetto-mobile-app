import 'dart:async';

import 'package:aipetto/modules/businessServiceAvailability/models/service_availabilities.dart';
import 'package:aipetto/modules/businessServiceAvailability/services/serviceAvailabilityApiClient.dart';

class ServiceAvailabilityRespository {
  final ServiceAvailabilityApiClient serviceAvailabilityApiClient;

  ServiceAvailabilityRespository(this.serviceAvailabilityApiClient) : assert(serviceAvailabilityApiClient != null);

  Future<List<ServiceAvailability>> fetchBusinessServiceAvailability(String serviceId, String businessTenant, String businessId) async{
    return await serviceAvailabilityApiClient.getAvailabilityForServiceRegisteredToBusiness(serviceId, businessTenant, businessId);
  }
}