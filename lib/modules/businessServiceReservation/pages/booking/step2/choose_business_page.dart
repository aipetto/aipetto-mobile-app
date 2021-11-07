import 'package:aipetto/modules/businessPlace/bloc/business_place_bloc.dart';
import 'package:aipetto/modules/businessPlace/repository/business_place_repository.dart';
import 'package:aipetto/modules/businessPlace/services/businessPlaceApiClient.dart';
import 'package:aipetto/modules/businessServiceReservation/widgets/business_place_list_widget.dart';
import 'package:aipetto/routes/routes.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;

class ChooseBusinessPlacePage extends StatefulWidget {
  @override
  _ChooseBusinessPlacePageState createState() =>
      _ChooseBusinessPlacePageState();
}

class _ChooseBusinessPlacePageState extends State<ChooseBusinessPlacePage> {

  @override
  Widget build(BuildContext context) {

    final BusinessPlaceRespository businessPlaceRepository =
    BusinessPlaceRespository(
        businessPlaceApiClient: BusinessPlaceApiClient(
          httpClient: http.Client(),
        ));

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'businesses'.tr(),
          style: Theme.of(context)
              .textTheme
              .subtitle1
              .copyWith(fontWeight: FontWeight.w700, color: Colors.white),
        ),
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.of(context).pushNamed(Routes.categories);
              },
              tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
            );
          },
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
        create: (_) => BusinessPlaceBloc(businessPlaceRepository: businessPlaceRepository),
        child: BusinessPlaceListWidget()
      )
    );
  }
}
