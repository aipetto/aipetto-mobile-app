import 'dart:convert';

import 'package:aipetto/config/environment.dart';
import 'package:aipetto/config/storage/secure_storage.dart';
import 'package:meta/meta.dart';
import 'package:http/http.dart' as http;
import 'package:aipetto/modules/businessServiceReservation/models/service_reservation.dart';

abstract class ServiceReservationOperations {
  Future<Reservation> getPastUserReservationsBooked(DateTime currentDateTime);
  Future<Reservation> getReservationDetails(Reservation reservation);
  Future<Reservation> getFutureReservationsBooked(DateTime currentDateTime);
  Future<Reservation> getClosestFutureReservationBooked(DateTime currentDateTime);
  Future<Reservation> postNewConfirmationReservation(Reservation reservation, String tenantId);
}

class ServiceReservationApiClient implements ServiceReservationOperations{

  final _baseUrl = Environment.aipettoCoreApi;
  final SecureStorage secureStorageRepository = SecureStorage();
  final http.Client httpClient;

  ServiceReservationApiClient({
    @required this.httpClient,
  }) : assert(httpClient != null);

  @override
  Future<Reservation> getClosestFutureReservationBooked(DateTime currentDateTime) {
    // TODO: implement getClosestFutureReservationBooked
    throw UnimplementedError();
  }

  @override
  Future<Reservation> getFutureReservationsBooked(DateTime currentDateTime) {
    // TODO: implement getFutureReservationsBooked
    throw UnimplementedError();
  }

  @override
  Future<Reservation> getPastUserReservationsBooked(DateTime currentDateTime) {
    // TODO: implement getPastUserReservationsBooked
    throw UnimplementedError();
  }

  @override
  Future<Reservation> getReservationDetails(Reservation reservation) {
    // TODO: implement getReservationDetails
    throw UnimplementedError();
  }

  @override
  Future<Reservation> postNewConfirmationReservation(Reservation reservation, String businessPlaceTenantId) async{
    final jwtOnSecureStorage = await secureStorageRepository.getToken();

    final newReservationConfirmationInfo = {
      'data': {
        "serviceType": reservation.serviceType,
        "businessId": reservation.businessId,
        "placeId": reservation.place.id,
        "time": reservation.time,
        "date": reservation.date,
        "customerFirstName": "",
        "customerLastName": "",
        "customerEmail": "",
        "customerPhone": "",
        "createdBy": reservation.createdBy,
        "updatedBy": reservation.updatedBy
      }
    };

    final reservationAddResponse = await this.httpClient.post(
      Uri.parse('$_baseUrl/tenant/$businessPlaceTenantId/pet'),
      body: jsonEncode(newReservationConfirmationInfo),
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer ${jwtOnSecureStorage}',
      });

    if (reservationAddResponse.statusCode != 200) {
      throw new Exception('Error adding reservation');
    }

    final json = jsonDecode(reservationAddResponse.body);
    return Reservation.fromJson(json);
  }
}
