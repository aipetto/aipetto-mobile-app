part of 'service_reservation_bloc.dart';

@immutable
abstract class ServiceReservationEvent extends Equatable {}

class FetchNextClosestServiceReservation extends ServiceReservationEvent {
  final DateTime currentTime;
  final String userTenant;

  FetchNextClosestServiceReservation(this.userTenant, this.currentTime);

  @override
  List<Object> get props => [userTenant];
}

class FetchFutureServiceReservation extends ServiceReservationEvent {
  final DateTime currentTime;
  final String userTenant;

  FetchFutureServiceReservation(this.userTenant, this.currentTime);

  @override
  List<Object> get props => [userTenant];
}

class FetchPastServiceReservation extends ServiceReservationEvent {
  final DateTime currentTime;
  final String userTenant;

  FetchPastServiceReservation(this.userTenant, this.currentTime);

  @override
  List<Object> get props => [userTenant];
}