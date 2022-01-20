import 'dart:async';

import 'package:aipetto/modules/businessServicesTypes/models/business_services_type.dart';
import 'package:aipetto/modules/businessServicesTypes/services/businessServicesTypeApiClient.dart';

class BusinessServiceTypesRepository {
  final BusinessServicesTypesApiClient businessServiceTypesClient;

  BusinessServiceTypesRepository({required this.businessServiceTypesClient})
      : assert(businessServiceTypesClient != null);

  Future<BusinessServiceType> fetchBusinessServiceTypes() async {
    return await businessServiceTypesClient.fetchBusinessServiceTypes();
  }
}
