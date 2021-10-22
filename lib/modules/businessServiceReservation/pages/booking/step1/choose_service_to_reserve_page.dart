import 'package:aipetto/modules/businessServiceReservation/pages/booking/step1/business_service_type_list.dart';
import 'package:aipetto/modules/businessServicesTypes/bloc/business_services_types_bloc.dart';
import 'package:aipetto/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:aipetto/modules/businessServicesTypes/repository/business_services_types_repository.dart';
import 'package:aipetto/modules/businessServicesTypes/services/businessServicesTypeApiClient.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;

class ChooseServiceToReservePage extends StatelessWidget {

  final BusinessServiceTypesRepository petServiceTypeRepository = BusinessServiceTypesRepository(
      businessServiceTypesClient: BusinessServicesTypesApiClient(
        httpClient: http.Client(),
      ));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.of(context).pushNamed(Routes.home);
              },
              tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
            );
          },
        ),
      ),
      body: BlocProvider<BusinessServicesTypesBloc>(
          create: (_) => BusinessServicesTypesBloc(
              businessServiceTypeRepository: petServiceTypeRepository
          )..add(FetchBusinessServicesTypes()),
        child: BusinessServiceTypeList(),
      ),
    );
  }
}

