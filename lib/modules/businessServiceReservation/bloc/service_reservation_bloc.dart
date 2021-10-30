import 'dart:async';

import 'package:aipetto/modules/businessServiceReservation/models/service_reservation.dart';
import 'package:aipetto/modules/businessServiceReservation/repository/service_reservation.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

part 'service_reservation_event.dart';
part 'service_reservation_state.dart';

class ServiceReservationBloc extends Bloc<ServiceReservationEvent, ServiceReservationState> {
  final BusinessServiceReservationRepository serviceReservationRepository;

  ServiceReservationBloc({@required this.serviceReservationRepository}) : assert(serviceReservationRepository != null), super(null);

  @override
  Stream<ServiceReservationState> mapEventToState(event) async* {
    if (event is FetchNextClosestServiceReservation){
      yield ServiceReservationLoading();
      try{
        final DateTime currentDate = new DateTime.now();
        final List<Reservation> serviceReservation = await serviceReservationRepository.getClosestFutureReservationBooked(currentDate, event.userTenant);
        yield NextClosestServiceReservationLoaded(serviceReservation: serviceReservation);
      } catch (_) {
        yield ServiceAvailabilityError();
      }
    }

    if (event is FetchFutureServiceReservation){
      yield ServiceReservationLoading();
      try{
        final DateTime currentDate = new DateTime.now();
        final List<Reservation> serviceReservations = await serviceReservationRepository.getFutureReservationsBooked(currentDate, event.userTenant);
        yield FutureServiceReservationLoaded(serviceReservations: serviceReservations);
      } catch (_) {
        yield ServiceAvailabilityError();
      }
    }

    if (event is FetchPastServiceReservation){
      yield ServiceReservationLoading();
      try{
        final DateTime currentDate = new DateTime.now();
        final DateTime currentDateLessOneDay = currentDate.subtract(new Duration(days: 1));
        final List<Reservation> serviceReservations = await serviceReservationRepository.getPastUserReservationsBooked(currentDateLessOneDay, event.userTenant);
        yield PastServiceReservationLoaded(serviceReservations: serviceReservations);
      } catch (_) {
        yield ServiceAvailabilityError();
      }
    }
  }
}