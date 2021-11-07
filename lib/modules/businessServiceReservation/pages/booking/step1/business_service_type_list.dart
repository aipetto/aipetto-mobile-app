import 'package:aipetto/modules/businessServiceReservation/bloc/cart/booking_cart_bloc.dart';
import 'package:aipetto/modules/businessServicesTypes/bloc/business_services_types_bloc.dart';
import 'package:aipetto/modules/businessServicesTypes/models/business_services_type.dart';
import 'package:aipetto/modules/businessServicesTypes/widgets/service_type_item.dart';
import 'package:aipetto/modules/shared/widgets/no_data_available_widget.dart';
import 'package:aipetto/routes/routes.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class BusinessServiceTypeList extends StatefulWidget {
  @override
  _BusinessServiceTypeListState createState() =>
      _BusinessServiceTypeListState();
}

class _BusinessServiceTypeListState extends State<BusinessServiceTypeList> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BusinessServicesTypesBloc, BusinessServicesTypesState>(
      builder: (context, state) {
        if (state == null || state is BusinessServicesTypesEmpty) {
          BlocProvider.of<BusinessServicesTypesBloc>(context)
              .add(FetchBusinessServicesTypes());
        }
        if (state is BusinessServicesTypesError) {
          return NoDataAvailableWidget();
        }
        if (state is BusinessServicesTypesLoaded) {
          return Scaffold(
              body: Column(
            children: <Widget>[
              Expanded(
                  child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    SizedBox(
                      height: 20,
                    ),
                    StaggeredGridView.countBuilder(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      crossAxisCount: 4,
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: state
                          .businessServiceType.businessServiceTypesRows.length,
                      staggeredTileBuilder: (int index) => StaggeredTile.fit(2),
                      mainAxisSpacing: 10,
                      crossAxisSpacing: 10,
                      itemBuilder: (context, index) {
                        return ServiceTypeItem(
                          serviceType: state.businessServiceType
                              .businessServiceTypesRows[index],
                          onTap: () {
                            BlocProvider.of<BookingCartBloc>(context).add(AddBookingService(state.businessServiceType.businessServiceTypesRows[index].id));
                            Navigator.of(context).pushNamed(Routes.bookingStep1FindPlacesNearby,
                            arguments: ServiceTypeSelected(state.businessServiceType.businessServiceTypesRows[index].id));
                          },
                        );
                      },
                    ),
                    SizedBox(
                      height: 20,
                    ),
                  ],
                ),
              ))
            ],
          ));
        }
        ;
        return Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }
}
