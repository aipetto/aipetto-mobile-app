import 'dart:convert';

import 'package:aipetto/config/environment.dart';
import 'package:aipetto/config/storage/secure_storage.dart';
import 'package:aipetto/modules/user/models/user.dart';
import 'package:intl/intl.dart';
import 'package:meta/meta.dart';
import 'package:http/http.dart' as http;
import 'package:aipetto/modules/businessServiceReservation/models/service_reservation.dart';

abstract class ServiceReservationOperations {
  Future<List<Reservation>> getPastUserReservationsBooked(DateTime currentDateTime, String userTenant);
  Future<Reservation> getReservationDetails(String reservationId, String userTenant);
  Future<List<Reservation>> getFutureReservationsBooked(DateTime currentDateTime, String userTenant);
  Future<List<Reservation>> getClosestFutureReservationBooked(DateTime currentDateTime, String userTenant);
  Future postNewConfirmationReservation(Reservation reservation, String tenantId, User user);
}

class ServiceReservationApiClient implements ServiceReservationOperations {
  final _baseUrl = Environment.aipettoCoreApi;
  final SecureStorage secureStorageRepository = SecureStorage();
  final http.Client httpClient;

  ServiceReservationApiClient({
    @required this.httpClient,
  }) : assert(httpClient != null);

  @override
  Future<List<Reservation>> getClosestFutureReservationBooked(DateTime currentDate, String userTenant) async {

    final jwtOnSecureStorage = await secureStorageRepository.getToken();

    final url = '$_baseUrl/customer-service-reservation?filter%5BdateRange%5D=$currentDate&filter%5BuserTenant%5D=$userTenant&orderBy=date_ASC&limit=1&offset=0';
    final reservationsResponse = await this.httpClient.get(url, headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer ${jwtOnSecureStorage}',
    });

    if(reservationsResponse.statusCode != 200) {
      throw new Exception('Error get closest future reservation');
    }

    final json = jsonDecode(reservationsResponse.body);
    return ServiceReservations.fromJson(json).rows;
  }

  @override
  Future<List<Reservation>> getFutureReservationsBooked(DateTime currentDate, String userTenant) async {

    final jwtOnSecureStorage = await secureStorageRepository.getToken();

    final url = '$_baseUrl/customer-service-reservation?filter%5BdateRange%5D=$currentDate&filter%5BuserTenant%5D=$userTenant&orderBy=date_ASC';
    final reservationsResponse = await this.httpClient.get(url, headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer ${jwtOnSecureStorage}',
    });

    if(reservationsResponse.statusCode != 200) {
      throw new Exception('Error getting future reservations');
    }

    final json = jsonDecode(reservationsResponse.body);
    return ServiceReservations.fromJson(json).rows;
  }

  @override
  Future<List<Reservation>> getPastUserReservationsBooked(DateTime currentDateLessOneDay, String userTenant) async {


    final jwtOnSecureStorage = await secureStorageRepository.getToken();

    final url = '$_baseUrl/customer-service-reservation?&filter%5BdateRange%5D=2021-09-01&filter%5BdateRange%5D=$currentDateLessOneDay&filter%5BuserTenant%5D=$userTenant&orderBy=date_DESC';
    final reservationsResponse = await this.httpClient.get(url, headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer ${jwtOnSecureStorage}',
    });

    if(reservationsResponse.statusCode != 200) {
      throw new Exception('Error getting past reservations');
    }

    final json = jsonDecode(reservationsResponse.body);
    return ServiceReservations.fromJson(json).rows;
  }

  @override
  Future<Reservation> getReservationDetails(String reservationId, String userTenant) async {

    final jwtOnSecureStorage = await secureStorageRepository.getToken();

    final url = '$_baseUrl/user/$userTenant/service-reservation/$reservationId';
    final serviceResponse = await this.httpClient.get(url, headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer ${jwtOnSecureStorage}',
    });

    if(serviceResponse.statusCode != 200) {
      throw new Exception('Error get the reservation detail');
    }

    final json = jsonDecode(serviceResponse.body);
    return Reservation.fromJson(json);
  }

  @override
  Future postNewConfirmationReservation(
      Reservation reservation, String businessPlaceTenantId, User user) async {
    final jwtOnSecureStorage = await secureStorageRepository.getToken();

    final newReservationConfirmationInfo = {
      'data': {
        "serviceType": reservation.serviceType[0].id,
        "businessId": reservation.businessId.id,
        "placeId": reservation.place.id,
        "time": reservation.time,
        "date": DateFormat('yyyy-MM-dd').format(reservation.date).toString(),
        "customerTenant": reservation.customerTenant,
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
        Uri.parse(
            '$_baseUrl/tenant/$businessPlaceTenantId/service-reservation'),
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
