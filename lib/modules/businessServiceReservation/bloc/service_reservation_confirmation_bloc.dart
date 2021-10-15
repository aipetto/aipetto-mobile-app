import 'dart:async';
import 'dart:core';

import 'package:aipetto/modules/businessServiceReservation/models/service_reservation.dart';
import 'package:aipetto/modules/businessServiceReservation/repository/service_reservation.dart';
import 'package:bloc/bloc.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

part 'service_reservation_confirmation_event.dart';
part 'service_reservation_confirmation_state.dart';

class ServiceReservationFormBloc extends Bloc<ServiceReservationConfirmationEvent, ServiceReservationConfirmationState> {
  final BusinessServiceReservationRepository repository;

  ServiceReservationFormBloc({
    @required this.repository,
  })  : assert(repository != null),
        super(null);

  @override
  Future<void> close() {
    return super.close();
  }

  @override
  Stream<ServiceReservationConfirmationState> mapEventToState(ServiceReservationConfirmationEvent event) async* {
    if (event is NewServiceReservationFormButtonPressed) {
      yield* _mapNewPetToState(event);
    }
  }

  Stream<ServiceReservationConfirmationState> _mapNewPetToState(NewServiceReservationFormButtonPressed event) async* {
    yield ServiceReservationLoading();
    try {
      await repository.addNewReservation(event.reservation);
      yield ServiceReservationSuccess();
    } catch (err) {
      yield ServiceReservationFailure('unknown_failure_error'.tr());
    }
  }
}
