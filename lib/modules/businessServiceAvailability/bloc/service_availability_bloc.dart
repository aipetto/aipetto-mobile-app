import 'dart:async';

import 'package:aipetto/modules/businessServiceAvailability/models/service_availabilities.dart';
import 'package:aipetto/modules/businessServiceAvailability/repository/service_availability_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

part 'service_availability_event.dart';
part 'service_availability_state.dart';

class ServiceAvailabilityBloc extends Bloc<ServiceAvailabilityEvent, ServiceAvailabilityState> {
  final ServiceAvailabilityRespository serviceAvailabilityRespository;

  ServiceAvailabilityBloc({required this.serviceAvailabilityRespository}) : assert(serviceAvailabilityRespository != null), super(ServiceAvailabilityEmpty());

  @override
  Stream<ServiceAvailabilityState> mapEventToState(event) async* {
    if (event is FetchServiceAvailabilities){
      yield ServiceAvailabilityLoading();
      try{
        final List<ServiceAvailability>? serviceAvailabilities = await serviceAvailabilityRespository.fetchBusinessServiceAvailability(
            event.serviceId,
            event.businessTenant,
            event.businessId,
            event.dateToFilterTimeSlot
        );
        yield ServiceAvailabilityLoaded(serviceAvailabilities: serviceAvailabilities);
      } catch (_) {
        yield ServiceAvailabilityError();
      }
    }
  }
}