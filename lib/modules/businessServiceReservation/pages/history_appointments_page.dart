import 'package:aipetto/modules/auth/services/auth_service.dart';
import 'package:aipetto/modules/auth/widgets/cta_authentication_widget.dart';
import 'package:aipetto/modules/businessServiceReservation/bloc/service_reservation_bloc.dart';
import 'package:aipetto/modules/businessServiceReservation/repository/service_reservation.dart';
import 'package:aipetto/modules/businessServiceReservation/services/serviceReservationApiClient.dart';
import 'package:aipetto/modules/businessServiceReservation/widgets/history_appointments_list_item.dart';
import 'package:aipetto/modules/home/widgets/no_appointments_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;

class HistoryParentAppointmentsPage extends StatelessWidget {
  final BusinessServiceReservationRepository businessServiceRepository = BusinessServiceReservationRepository(
      reservationClient: ServiceReservationApiClient(
        httpClient: http.Client(),
      ));

  final AuthenticationService userRepository =
  AipettoCoreAuthenticationService(httpClient: http.Client());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider<ServiceReservationBloc>(
        create: (context) => ServiceReservationBloc(authenticationService: userRepository, serviceReservationRepository: businessServiceRepository)
          ..add(FetchPastServiceReservation()),
        child: HistoryAppointmentsPage(),
      ),
    );
  }
}

class HistoryAppointmentsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocListener<ServiceReservationBloc, ServiceReservationState>(
        listener: (context, state) { },
        child: BlocBuilder<ServiceReservationBloc, ServiceReservationState>(
            builder: (context, state){
              if (state == null  || state is ServiceReservationEmpty) {
                BlocProvider.of<ServiceReservationBloc>(context).add(FetchPastServiceReservation());
              }
              if (state is ServiceReservationLoading) {
                return Flexible(child: Center(child: CircularProgressIndicator()));
              } else if (state is ServiceReservationError) {
                return CtaAuthenticationWidget();
              } else if (state is ServiceReservationEmpty) {
                return Card(
                  child: Row(
                    children: <Widget>[
                      Expanded(
                          flex: 2,
                          child: NoAppointmentsWidget()
                      )
                    ],
                  ),
                );
              } else if (state is PastServiceReservationLoaded){
                final reservations = state.serviceReservations;
                return ListView.separated(
                  separatorBuilder: (context, index) => SizedBox(
                    height: 15,
                  ),
                  itemCount: reservations.length,
                  padding: EdgeInsets.symmetric(
                    vertical: 35,
                    horizontal: 15,
                  ),
                  itemBuilder: (context, index) {
                    return HistoryAppointmentListItem(reservation: reservations[index]);
                  },
                );
              } else {
                return Card(
                  child: Row(
                    children: <Widget>[
                      Expanded(
                          flex: 2,
                          child: NoAppointmentsWidget()
                      )
                    ],
                  ),
                );
              }
            }
        )
    );
  }
}
