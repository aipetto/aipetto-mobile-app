import 'package:aipetto/config/pref_manager.dart';
import 'package:aipetto/modules/businessPlace/models/business_place.dart';
import 'package:aipetto/modules/businessPlace/widgets/business_place_item.dart';
import 'package:aipetto/modules/businessServiceAvailability/bloc/service_availability_bloc.dart';
import 'package:aipetto/modules/businessServiceAvailability/repository/service_availability_repository.dart';
import 'package:aipetto/modules/businessServiceAvailability/services/serviceAvailabilityApiClient.dart';
import 'package:aipetto/modules/businessServiceReservation/bloc/cart/booking_cart_bloc.dart';
import 'package:aipetto/modules/businessServiceReservation/pages/booking/step3/time_slot_item.dart';
import 'package:aipetto/routes/routes.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;

class TimeSlotPage extends StatefulWidget {

  final BusinessPlace businessPlace;

  const TimeSlotPage({Key key, this.businessPlace}) : super(key: key);

  @override
  _TimeSlotPageState createState() => _TimeSlotPageState();
}

class _TimeSlotPageState extends State<TimeSlotPage>  {
  final formKey = GlobalKey<FormState>();
  DateTime selectedBookingDate;
  ValueChanged<DateTime> selectBookingDateFromCalendar;
  TextEditingController dtBookingEditingController = new TextEditingController();

  Widget _inputBookingDateFromCalendar(){
    return TextFormField(
      controller: dtBookingEditingController,
      onTap: () async {
        FocusScope.of(context).requestFocus(new FocusNode());
        // Show Date Picker
        await _selectBookingDateFromCalendar(context);
        dtBookingEditingController.text = DateFormat('dd/MM/yyyy').format(selectedBookingDate);
      },
      readOnly: true,
      decoration: InputDecoration(labelText: 'date'.tr()),
    );
  }

  Future<void> _selectBookingDateFromCalendar(BuildContext context) async {
    final DateTime pickedDate = await showDatePicker(
        context: context,
        initialDate: selectedBookingDate ?? DateTime.now(),
        firstDate: DateTime(2021,1),
        lastDate: DateTime(2041));
    if(pickedDate != null && pickedDate != selectedBookingDate){
      setState((){
        BlocProvider.of<ServiceAvailabilityBloc>(context)
            .add(FetchServiceAvailabilities(
              dateToFilterTimeSlot: DateFormat('yyyy-MM-dd').format(pickedDate).toString()
        ));
        selectedBookingDate = pickedDate;
      });
    }
  }

  @override
  Widget build(BuildContext context) {

    final bookingCartState = BlocProvider.of<BookingCartBloc>(context).state;
    dtBookingEditingController.text = DateFormat('dd/MM/yyyy').format(selectedBookingDate ?? DateTime.now());
    selectedBookingDate = selectedBookingDate ?? DateTime.now();

    final ServiceAvailabilityRespository serviceAvailabilityRepository = ServiceAvailabilityRespository(
        ServiceAvailabilityApiClient(http.Client()));

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('time_slot'.tr(),
            style: Theme.of(context)
                .textTheme
                .subtitle1
                .copyWith(fontWeight: FontWeight.w700, color: Colors.white)),
        actions: <Widget>[
          IconButton(
            onPressed: () => Navigator.pushNamed(context, Routes.home),
            icon: Icon(
              Icons.home,
            ),
          )
        ],
      ),
      body: BlocProvider<ServiceAvailabilityBloc>(
        create: (_) => ServiceAvailabilityBloc(
        serviceAvailabilityRespository: serviceAvailabilityRepository
        ),
        child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                BusinessPlaceItem(
                  businessPlace: bookingCartState.place,
                ),
                Container(
                  width: double.infinity,
                  height: 85,
                  padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 80.0),
                  color: Prefs.getBool(Prefs.DARKTHEME, def: false)
                      ? Colors.white.withOpacity(0.12)
                      : Colors.green[100],
                  child: Form(
                      key: formKey,
                      child: Column(
                        children: <Widget>[
                            _inputBookingDateFromCalendar(),
                        ],
                      )),
                ),
                Divider(
                  color: Colors.grey,
                  height: 1,
                  indent: 15,
                  endIndent: 15,
                ),
                SizedBox(
                  height: 25,
                ),
                TimeSlotItemPage(
                  serviceId: bookingCartState.serviceId,
                  businessTenant: bookingCartState.place.tenant,
                  businessId: bookingCartState.place.businessId.id,
                  dateToFilterTimeSlot: selectedBookingDate,
                ),
              ],
            ),
           ),
    ),
    );
  }
}
