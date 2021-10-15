
import 'package:aipetto/modules/businessServiceReservation/models/service_reservation.dart';

abstract class ServiceReservationOperations {
  Future<Reservation> getPastUserReservationsBooked(DateTime currentDateTime);
  Future<Reservation> getReservationDetails(Reservation reservation);
  Future<Reservation> getFutureReservationsBooked(DateTime currentDateTime);
  Future<Reservation> getClosestFutureReservationBooked(DateTime currentDateTime);
  Future<Reservation> postNewConfirmationReservation(Reservation reservation);
}


class ServiceReservationApiClient implements ServiceReservationOperations{
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
  Future<Reservation> postNewConfirmationReservation(Reservation reservation) {
    // TODO: implement postNewConfirmationReservation
    throw UnimplementedError();
  }

}
