part of 'service_reservation_confirmation_bloc.dart';

@immutable
abstract class ServiceReservationConfirmationEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class NewServiceReservationFormButtonPressed extends ServiceReservationConfirmationEvent {
  final Reservation reservation;
  final String businessPlaceTenantId;

  NewServiceReservationFormButtonPressed({
    Reservation this.reservation,
    String this.businessPlaceTenantId
  });

  @override
  List<Object> get props => [reservation];
}
