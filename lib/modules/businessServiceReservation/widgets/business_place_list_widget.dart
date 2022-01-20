import 'package:aipetto/modules/businessPlace/bloc/business_place_bloc.dart';
import 'package:aipetto/modules/businessPlace/models/business_place.dart';
import 'package:aipetto/modules/businessPlace/widgets/business_place_item.dart';
import 'package:aipetto/modules/shared/widgets/no_data_available_widget.dart';
import 'package:aipetto/routes/routes.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BusinessPlaceListWidget extends StatefulWidget {
  @override
  _BusinessPlaceListWidget createState() =>
      _BusinessPlaceListWidget();
}

class _BusinessPlaceListWidget extends State<BusinessPlaceListWidget> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BusinessPlaceBloc, BusinessPlaceState>(
      builder: (context, state) {
        if (state == null || state is BusinessPlaceEmpty) {
          BlocProvider.of<BusinessPlaceBloc>(context)
              .add(BusinessPlacesNearby());
        }
        if (state is BusinessPlaceError) {
          return NoDataAvailableWidget();
        }
        if (state is NearbyBusinessPlaceLoaded) {
          return Scaffold(
              body: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.all(20),
                      child: Text(
                        'choose_a_business_place'.tr(),
                        style: Theme.of(context).textTheme.headline6?.copyWith(
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    ListView.separated(
                      separatorBuilder: (context, index) => Divider(),
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: state.businessesPlaces.length,
                      itemBuilder: (context, index) {
                        return BusinessPlaceItem(
                          onTap: () {
                            Navigator.of(context)
                                .pushNamed(Routes.bookingStep2DetailsOfPlace,
                                arguments: BusinessPlaceSelected(state.businessesPlaces[index]));
                          },
                          businessPlace: state.businessesPlaces[index],
                        );
                      },
                    ),
                  ],
                ),
              ),
          );
        }
        return Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }
}
