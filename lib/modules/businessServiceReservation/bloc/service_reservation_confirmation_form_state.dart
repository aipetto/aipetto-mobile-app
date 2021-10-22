part of 'service_reservation_confirmation_form_bloc.dart';

abstract class ServiceReservationConfirmationFormState extends Equatable {
  @override
  List<Object> get props => [];
}

class ServiceReservationFormInitial extends ServiceReservationConfirmationFormState {}

class ServiceReservationFormLoading extends ServiceReservationConfirmationFormState {}

class ServiceReservationFormSuccess extends ServiceReservationConfirmationFormState {
  final Reservation reservation;

  ServiceReservationFormSuccess({@required this.reservation});

  @override
  List<Object> get props => [reservation];
}

class ServiceReservationFormFailure extends ServiceReservationConfirmationFormState {
  final String error;

  ServiceReservationFormFailure(this.error);

  @override
  List<Object> get props => [error];
}
