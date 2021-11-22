import 'dart:async';

import 'package:aipetto/modules/businessServicePrice/models/business_service_prices.dart';
import 'package:aipetto/modules/businessServicePrice/services/businessServicesPricesApiClient.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

class BusinessServicesPricesRepository {
  final BusinessServicesPricesApiClient businessServicesPricesClient;

  BusinessServicesPricesRepository({@required this.businessServicesPricesClient})
      : assert(businessServicesPricesClient != null);

  Future<List<BusinessServicePrice>> fetchBusinessServicesPrices(String businessTenant) async {
    return await businessServicesPricesClient.fetchBusinessServicesPrices(businessTenant);
  }
}
