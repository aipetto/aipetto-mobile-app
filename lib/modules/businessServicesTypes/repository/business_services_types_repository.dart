import 'dart:async';

import 'package:aipetto/modules/businessServicesTypes/models/business_services_type.dart';
import 'package:aipetto/modules/businessServicesTypes/services/businessServicesTypeApiClient.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

class BusinessServiceTypesRepository {
  final BusinessServicesTypesApiClient businessServiceTypesClient;

  BusinessServiceTypesRepository({@required this.businessServiceTypesClient})
      : assert(businessServiceTypesClient != null);

  Future<BusinessServiceType> fetchBusinessServiceTypes() async {
    return await businessServiceTypesClient.fetchBusinessServiceTypes();
  }
}
