import 'dart:async';

import 'package:aipetto/modules/businessServiceReservation/models/service_reservation.dart';
import 'package:aipetto/modules/businessServiceReservation/services/serviceReservationApiClient.dart';
import 'package:aipetto/modules/user/models/user.dart';

class BusinessServiceReservationRepository {
  final ServiceReservationApiClient reservationClient;

  BusinessServiceReservationRepository({required this.reservationClient})
      : assert(reservationClient != null);

  Future<List<Reservation>> getClosestFutureReservationBooked(DateTime currentDate, String? userTenant) async {
    return await reservationClient.getClosestFutureReservationBooked(currentDate, userTenant);
  }

  Future<List<Reservation>> getFutureReservationsBooked(String currentDate, String? userTenant) async {
    return await reservationClient.getFutureReservationsBooked(currentDate, userTenant);
  }

  Future<List<Reservation>> getPastUserReservationsBooked(DateTime currentDateLessOneDay, String? userTenant) async {
    return await reservationClient.getPastUserReservationsBooked(currentDateLessOneDay, userTenant);
  }

  Future<Reservation> fetchReservationDetail(String reservationId, String userTenant) async {
    return await reservationClient.getReservationDetails(reservationId, userTenant);
  }

  Future<Reservation> addNewReservation(
      Reservation reservation, String businessPlaceTenantId, User user) async {
    return await reservationClient.postNewConfirmationReservation(
        reservation, businessPlaceTenantId, user);
  }

}
