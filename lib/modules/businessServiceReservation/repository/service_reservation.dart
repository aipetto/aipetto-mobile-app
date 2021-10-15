import 'dart:async';

import 'package:aipetto/modules/businessServiceReservation/models/service_reservation.dart';
import 'package:aipetto/modules/businessServiceReservation/services/serviceReservationApiClient.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';


class BusinessServiceReservationRepository {
  final ServiceReservationApiClient reservationClient;

  BusinessServiceReservationRepository({@required this.reservationClient}) : assert(reservationClient != null);

  Future<Reservation> fetchReservationDetail(Reservation reservation) async {
    return await reservationClient.getReservationDetails(reservation);
  }

  Future<Reservation> addNewReservation(Reservation reservation) async {
    return await reservationClient.postNewConfirmationReservation(reservation);
  }
}