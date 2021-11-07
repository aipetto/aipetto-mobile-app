import 'dart:async';

import 'package:aipetto/modules/businessPlace/models/business_place.dart';
import 'package:aipetto/modules/businessPlace/services/businessPlaceApiClient.dart';

class BusinessPlaceRespository {
  final BusinessPlaceApiClient businessPlaceApiClient;

  BusinessPlaceRespository(this.businessPlaceApiClient) : assert(businessPlaceApiClient != null);

  Future<List<BusinessPlace>> fetchBusinessPlacesNearby(String geolocation, String serviceId, String businessTenant) async {
    return await businessPlaceApiClient.getBusinessPlaceNearby(geolocation, serviceId, businessTenant);
  }

  Future<BusinessPlace> fetchBusinessDetail(String businessTenant, String placeId) async{
    return await businessPlaceApiClient.getBusinessPlaceDetail(businessTenant, placeId);
  }
}