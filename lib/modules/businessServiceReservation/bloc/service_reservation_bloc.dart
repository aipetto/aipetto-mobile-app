import 'dart:async';

import 'package:aipetto/modules/auth/services/auth_service.dart';
import 'package:aipetto/modules/businessServiceReservation/models/service_reservation.dart';
import 'package:aipetto/modules/businessServiceReservation/repository/service_reservation.dart';
import 'package:aipetto/modules/user/models/user.dart';
import 'package:bloc/bloc.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

part 'service_reservation_event.dart';
part 'service_reservation_state.dart';

class ServiceReservationBloc extends Bloc<ServiceReservationEvent, ServiceReservationState> {
  final BusinessServiceReservationRepository serviceReservationRepository;
  final AuthenticationService authenticationService;

  ServiceReservationBloc({@required this.authenticationService, @required this.serviceReservationRepository}) : assert(serviceReservationRepository != null), super(null);

  @override
  Stream<ServiceReservationState> mapEventToState(event) async* {
    if (event is FetchNextClosestServiceReservation){
      yield ServiceReservationLoading();
      try{
        final DateTime currentDate = new DateTime.now();
        final User currentUser = await authenticationService.getCurrentUser();
        final List<Reservation> serviceReservation = await serviceReservationRepository.getClosestFutureReservationBooked(
            currentDate, currentUser.tenants.first.tenant.id
        );
        yield NextClosestServiceReservationLoaded(serviceReservation: serviceReservation);
      } catch (_) {
        yield ServiceReservationError();
      }
    }

    if (event is FetchFutureServiceReservation){
      yield ServiceReservationLoading();
      try{
        final DateTime currentDate = new DateTime.now();
        final String formatDate = DateFormat('yyyy-MM-dd').format(currentDate).toString();
        final User currentUser = await authenticationService.getCurrentUser();
        final List<Reservation> serviceReservations = await serviceReservationRepository.getFutureReservationsBooked(formatDate, currentUser.tenants.first.tenant.id);
        if (serviceReservations.length > 0){
          yield FutureServiceReservationLoaded(serviceReservations: serviceReservations);
        }else{
          yield ServiceReservationEmpty();
        }
      } catch (_) {
        yield ServiceReservationError();
      }
    }

    if (event is FetchPastServiceReservation){
      yield ServiceReservationLoading();
      try{
        final DateTime currentDate = new DateTime.now();
        final User currentUser = await authenticationService.getCurrentUser();
        final DateTime currentDateLessOneDay = currentDate.subtract(new Duration(days: 1));
        final List<Reservation> serviceReservations = await serviceReservationRepository.getPastUserReservationsBooked(currentDateLessOneDay, currentUser.tenants.first.tenant.id);
        if (serviceReservations.length > 0) {
          yield PastServiceReservationLoaded(serviceReservations: serviceReservations);
        } else {
          yield ServiceReservationEmpty();
        }
      } catch (_) {
        yield ServiceReservationError();
      }
    }
  }
}