part of 'service_reservation_bloc.dart';

@immutable
abstract class ServiceReservationEvent extends Equatable {}

class FetchNextClosestServiceReservation extends ServiceReservationEvent {
  FetchNextClosestServiceReservation();

  @override
  List<Object> get props => [];
}

class FetchFutureServiceReservation extends ServiceReservationEvent {

  FetchFutureServiceReservation();

  @override
  List<Object> get props => [];
}

class FetchPastServiceReservation extends ServiceReservationEvent {

  FetchPastServiceReservation();

  @override
  List<Object> get props => [];
}