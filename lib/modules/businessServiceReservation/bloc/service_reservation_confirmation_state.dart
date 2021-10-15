part of 'service_reservation_confirmation_bloc.dart';

abstract class ServiceReservationConfirmationState extends Equatable {
  @override
  List<Object> get props => [];
}

class ServiceReservationInitial extends ServiceReservationConfirmationState {}

class ServiceReservationLoading extends ServiceReservationConfirmationState {}

class ServiceReservationSuccess extends ServiceReservationConfirmationState {
  final Reservation reservation;

  ServiceReservationSuccess({@required this.reservation});

  @override
  List<Object> get props => [reservation];
}

class ServiceReservationFailure extends ServiceReservationConfirmationState {
  final String error;

  ServiceReservationFailure(this.error);

  @override
  List<Object> get props => [error];
}
