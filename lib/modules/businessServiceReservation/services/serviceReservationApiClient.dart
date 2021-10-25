import 'dart:convert';

import 'package:aipetto/config/environment.dart';
import 'package:aipetto/config/storage/secure_storage.dart';
import 'package:aipetto/modules/user/models/user.dart';
import 'package:intl/intl.dart';
import 'package:meta/meta.dart';
import 'package:http/http.dart' as http;
import 'package:aipetto/modules/businessServiceReservation/models/service_reservation.dart';

abstract class ServiceReservationOperations {
  Future<Reservation> getPastUserReservationsBooked(DateTime currentDateTime);
  Future<Reservation> getReservationDetails(Reservation reservation);
  Future<Reservation> getFutureReservationsBooked(DateTime currentDateTime);
  Future<Reservation> getClosestFutureReservationBooked(DateTime currentDateTime);
  Future postNewConfirmationReservation(Reservation reservation, String tenantId, User user);
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
  Future postNewConfirmationReservation(
      Reservation reservation,
      String businessPlaceTenantId,
      User user
      ) async{
    final jwtOnSecureStorage = await secureStorageRepository.getToken();

    final newReservationConfirmationInfo = {
      'data': {
        "serviceType": reservation.serviceType[0].id,
        "businessId": reservation.businessId.id,
        "placeId": reservation.place.id,
        "time": reservation.time,
        "date": DateFormat('yyyy-MM-dd').format(reservation.date).toString(),
        "tenant": reservation.tenant,
        "totalPrice": reservation.totalPrice,
        "customerFirstName": user.firstName,
        "customerLastName": user.lastName,
        "customerEmail": user.email,
        "customerPhone": "11111",
        "createdBy": reservation.createdBy,
        "updatedBy": reservation.updatedBy,
        "source": reservation.source
      }
    };

    final reservationAddResponse = await this.httpClient.post(
      Uri.parse('$_baseUrl/tenant/$businessPlaceTenantId/service-reservation'),
      body: jsonEncode(newReservationConfirmationInfo),
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer ${jwtOnSecureStorage}',
      });

    if (reservationAddResponse.statusCode != 200) {
      throw new Exception('Error adding reservation');
    }
  }
}
