import 'package:aipetto/components/time_slot_item.dart';
import 'package:aipetto/modules/businessServiceAvailability/bloc/service_availability_bloc.dart';
import 'package:aipetto/modules/businessServiceAvailability/models/service_availabilities.dart';
import 'package:aipetto/modules/shared/widgets/no_data_available_widget.dart';
import 'package:aipetto/routes/routes.dart';
import 'package:aipetto/utils/constants.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class TimeSlotItemPage extends StatefulWidget {

  final String serviceId;
  final String businessTenant;
  final String businessId;
  final DateTime dateToFilterTimeSlot;

  const TimeSlotItemPage({Key key, this.serviceId, this.businessTenant, this.businessId, this.dateToFilterTimeSlot}) : super(key: key);

  @override
  _TimeSlotItemPageState createState() => _TimeSlotItemPageState();
}

class _TimeSlotItemPageState extends State<TimeSlotItemPage> {
  @override
  Widget build(BuildContext context) {
    DateTime initialDate;

    return BlocBuilder<ServiceAvailabilityBloc, ServiceAvailabilityState>(
      builder: (context, state) {
        if (state == null || state is ServiceAvailabilityEmpty) {
          initialDate = widget.dateToFilterTimeSlot;
          BlocProvider.of<ServiceAvailabilityBloc>(context)
              .add(FetchServiceAvailabilities(
                serviceId: widget.serviceId,
                businessTenant: widget.businessTenant,
                businessId: widget.businessId,
                dateToFilterTimeSlot: DateFormat('yyyy-MM-dd').format(widget.dateToFilterTimeSlot).toString()
              ));
        }
        if (state is ServiceAvailabilityError) {
          return NoDataAvailableWidget();
        }
        if (state is ServiceAvailabilityLoaded) {
          if(widget.dateToFilterTimeSlot != initialDate){
            initialDate = widget.dateToFilterTimeSlot;

            BlocProvider.of<ServiceAvailabilityBloc>(context)
                .add(FetchServiceAvailabilities(
                serviceId: widget.serviceId,
                businessTenant: widget.businessTenant,
                businessId: widget.businessId,
                dateToFilterTimeSlot: DateFormat('yyyy-MM-dd').format(widget.dateToFilterTimeSlot).toString()
            ));
          }

          return buildTimeSlotItems(state.serviceAvailabilities);
        };
        return Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }

  Widget buildTimeSlotItems(List<ServiceAvailability> serviceAvailabilities){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 15),
          child: RichText(
            text: TextSpan(
              children: [],
            ),
          ),
        ),
        SizedBox(
          height: 15,
        ),
        StaggeredGridView.countBuilder(
          padding: EdgeInsets.symmetric(horizontal: 10),
          crossAxisCount: 3,
          physics: NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: (serviceAvailabilities.length > 0 ? serviceAvailabilities[0].timeSlot.length : 0),
          staggeredTileBuilder: (int index) => StaggeredTile.fit(1),
          mainAxisSpacing: 5,
          crossAxisSpacing: 5,
          itemBuilder: (context, index) {
            return TimeSlotItem(
              time: serviceAvailabilities.first.timeSlot[index],
              onTap: () {
                Navigator.of(context)
                    .pushNamed(Routes.bookingStep4ReservationDetails);
              },
            );
          },
        ),
      ],
    );
  }
}
