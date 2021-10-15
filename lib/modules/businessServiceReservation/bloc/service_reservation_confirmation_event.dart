part of 'service_reservation_confirmation_bloc.dart';

@immutable
abstract class ServiceReservationConfirmationEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class NewServiceReservationFormButtonPressed extends ServiceReservationConfirmationEvent {
  final Reservation reservation;

  NewServiceReservationFormButtonPressed({Reservation this.reservation});

  @override
  List<Object> get props => [reservation];
}
