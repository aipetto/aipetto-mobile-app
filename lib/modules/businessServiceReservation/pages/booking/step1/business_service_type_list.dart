import 'package:aipetto/modules/businessServicesTypes/bloc/business_services_types_bloc.dart';
import 'package:aipetto/modules/businessServicesTypes/widgets/service_type_item.dart';
import 'package:aipetto/modules/shared/widgets/no_data_available_widget.dart';
import 'package:aipetto/routes/routes.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class BusinessServiceTypeList extends StatefulWidget {
  @override
  _BusinessServiceTypeListState createState() => _BusinessServiceTypeListState();
}

class _BusinessServiceTypeListState extends State<BusinessServiceTypeList> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BusinessServicesTypesBloc, BusinessServicesTypesState>(
      builder: (context, state) {
        if (state == null || state is BusinessServicesTypesEmpty) {
          BlocProvider.of<BusinessServicesTypesBloc>(context).add(
              FetchBusinessServicesTypes());
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
                            Padding(
                              padding: EdgeInsets.all(20),
                              child: Text(
                                'choose_pet_service'.tr(),
                                style: Theme
                                    .of(context)
                                    .textTheme
                                    .headline6
                                    .copyWith(
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ),
                            StaggeredGridView.countBuilder(
                              padding: EdgeInsets.symmetric(horizontal: 10),
                              crossAxisCount: 4,
                              physics: NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              itemCount: state.businessServiceType.businessServiceTypesRows.length,
                              staggeredTileBuilder: (int index) =>
                                  StaggeredTile.fit(2),
                              mainAxisSpacing: 10,
                              crossAxisSpacing: 10,
                              itemBuilder: (context, index) {
                                return ServiceTypeItem(
                                  serviceType: state.businessServiceType.businessServiceTypesRows[index],
                                  onTap: () {
                                    Navigator.of(context).pushNamed(
                                        Routes.loading);
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
        };
        return Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }

}