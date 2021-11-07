import 'dart:convert';

import 'package:aipetto/config/environment.dart';
import 'package:aipetto/config/storage/secure_storage.dart';
import 'package:aipetto/modules/businessPlace/models/business_place.dart';
import 'package:http/http.dart' as http;

abstract class BusinessPlaceOperations {
  Future<List<BusinessPlace>> getBusinessPlaceNearby(
      String geoLocation,
      String serviceId
   );

  Future<BusinessPlace> getBusinessPlaceDetail(
        String businessTenant,
        String placeId
      );
}

class BusinessPlaceApiClient implements BusinessPlaceOperations {
  final _baseUrl = Environment.aipettoCoreApi;
  final SecureStorage secureStorageRepository = SecureStorage();
  final http.Client httpClient;

  BusinessPlaceApiClient({this.httpClient});

  @override
  Future<BusinessPlace> getBusinessPlaceDetail(String businessTenant, String placeId) async {

    final jwtOnSecureStorage = await secureStorageRepository.getToken();

    final url = '$_baseUrl/tenant/$businessTenant/place/$placeId';
    final businessPlaceResponse = await this.httpClient.get(url, headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer ${jwtOnSecureStorage}',
    });

    if(businessPlaceResponse.statusCode != 200) {
      throw new Exception('Error get the availability for service');
    }

    final json = jsonDecode(businessPlaceResponse.body);
    return BusinessPlace.fromJson(json);
  }

  @override
  Future<List<BusinessPlace>> getBusinessPlaceNearby(String geoLocation, String serviceId) async {

    final jwtOnSecureStorage = await secureStorageRepository.getToken();

    // TODO For now we'll use this url but it should change to findPlacesNearbyByGeolocation: $_baseUrl/places/place/nearby
    final url = '$_baseUrl/places';

    final businessPlacesNearbyResponse = await this.httpClient.get(url, headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json'
    });

    if(businessPlacesNearbyResponse.statusCode != 200) {
      throw new Exception('Error get the business places nearby');
    }

    final json = jsonDecode(businessPlacesNearbyResponse.body);
    return BusinessPlacesList.fromJson(json).listPlaces;
  }

}

