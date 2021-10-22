part of 'service_reservation_confirmation_form_bloc.dart';

@immutable
abstract class ServiceReservationConfirmationFormEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class NewServiceReservationConfirmationFormButtonPressed extends ServiceReservationConfirmationFormEvent {
  final Reservation reservation;
  final String businessPlaceTenantId;

  NewServiceReservationConfirmationFormButtonPressed({
    Reservation this.reservation,
    String this.businessPlaceTenantId
  });

  @override
  List<Object> get props => [reservation];
}
