import 'dart:async';
import 'dart:core';

import 'package:aipetto/modules/businessServiceReservation/models/service_reservation.dart';
import 'package:aipetto/modules/businessServiceReservation/repository/service_reservation.dart';
import 'package:aipetto/modules/user/models/user.dart';
import 'package:bloc/bloc.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

part 'service_reservation_confirmation_form_event.dart';
part 'service_reservation_confirmation_form_state.dart';

class ServiceReservationConfirmationFormBloc extends Bloc<
    ServiceReservationConfirmationFormEvent,
    ServiceReservationConfirmationFormState> {
  final BusinessServiceReservationRepository repository;

  ServiceReservationConfirmationFormBloc({
    required this.repository,
  })  : assert(repository != null),
        super(null);

  @override
  Future<void> close() {
    return super.close();
  }

  @override
  Stream<ServiceReservationConfirmationFormState> mapEventToState(
      ServiceReservationConfirmationFormEvent event) async* {
    if (event is NewServiceReservationConfirmationFormButtonPressed) {
      yield* _mapNewPetToState(event);
    }
  }

  Stream<ServiceReservationConfirmationFormState> _mapNewPetToState(
      NewServiceReservationConfirmationFormButtonPressed event) async* {
    yield ServiceReservationFormLoading();
    try {
      await repository.addNewReservation(
          event.reservation, event.businessPlaceTenantId, event.user);
      yield ServiceReservationFormSuccess();
    } catch (err) {
      yield ServiceReservationFormFailure('unknown_failure_error'.tr());
    }
  }
}
