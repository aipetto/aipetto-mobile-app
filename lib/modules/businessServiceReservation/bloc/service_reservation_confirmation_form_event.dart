part of 'service_reservation_confirmation_form_bloc.dart';

@immutable
abstract class ServiceReservationConfirmationFormEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class NewServiceReservationConfirmationFormButtonPressed extends ServiceReservationConfirmationFormEvent {
  final Reservation reservation;
  final String businessPlaceTenantId;
  final User user;

  NewServiceReservationConfirmationFormButtonPressed({
    Reservation this.reservation,
    String this.businessPlaceTenantId,
    User this.user
  });

  @override
  List<Object> get props => [reservation];
}
