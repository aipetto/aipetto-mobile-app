import 'package:aipetto/modules/businessServiceReservation/bloc/service_reservation_confirmation_form_bloc.dart';
import 'package:aipetto/modules/businessServiceReservation/repository/service_reservation.dart';
import 'package:aipetto/modules/businessServiceReservation/services/serviceReservationApiClient.dart';
import 'package:aipetto/modules/businessServiceReservation/widgets/confirmation_reservation_widget.dart';
import 'package:aipetto/routes/routes.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;

class ReservationCustomerDetailsPage extends StatefulWidget {
  @override
  _ReservationCustomerDetailsPageState createState() =>
      _ReservationCustomerDetailsPageState();
}

class _ReservationCustomerDetailsPageState
    extends State<ReservationCustomerDetailsPage> {
  @override
  Widget build(BuildContext context) {
    final BusinessServiceReservationRepository serviceReservationRepository =
        BusinessServiceReservationRepository(
            reservationClient: ServiceReservationApiClient(
      httpClient: http.Client(),
    ));

    bool _isdark = false;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'reservation_details'.tr(),
          style: Theme.of(context)
              .textTheme
              .subtitle1
              .copyWith(fontWeight: FontWeight.w700, color: Colors.white),
        ),
        actions: <Widget>[
          IconButton(
            onPressed: () => Navigator.pushNamed(context, Routes.home),
            icon: Icon(
              Icons.home,
            ),
          )
        ],
      ),
      body: BlocProvider(
        create: (_) => ServiceReservationConfirmationFormBloc(
            repository: serviceReservationRepository),
        child: SafeArea(
          child: Column(
            children: <Widget>[
              Expanded(
                child: Container(
                  color: _isdark ? Colors.transparent : Colors.grey[300],
                  child: SingleChildScrollView(
                      scrollDirection: Axis.vertical,
                      child: ConfirmationServiceReservationWidget()),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
