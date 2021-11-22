part of 'service_reservation_bloc.dart';

abstract class ServiceReservationState extends Equatable {
  ServiceReservationState();

  @override
  List<Object> get props => [];
}

class ServiceReservationEmpty extends ServiceReservationState {}

class ServiceReservationLoading extends ServiceReservationState {}

class NextClosestServiceReservationLoaded extends ServiceReservationState {
  final List<Reservation> serviceReservation;

  NextClosestServiceReservationLoaded({@required this.serviceReservation}) : assert(serviceReservation != null);

  @override
  List<Object> get props => [serviceReservation];
}

class FutureServiceReservationLoaded extends ServiceReservationState {
  final List<Reservation> serviceReservations;

  FutureServiceReservationLoaded({@required this.serviceReservations}) : assert(serviceReservations != null);

  @override
  List<Object> get props => [serviceReservations];
}

class PastServiceReservationLoaded extends ServiceReservationState {
  final List<Reservation> serviceReservations;

  PastServiceReservationLoaded({@required this.serviceReservations}) : assert(serviceReservations != null);

  @override
  List<Object> get props => [serviceReservations];
}

class ServiceReservationError extends ServiceReservationState {}
