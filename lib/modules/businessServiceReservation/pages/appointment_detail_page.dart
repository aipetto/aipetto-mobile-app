import 'package:aipetto/components/custom_button.dart';
import 'package:aipetto/modules/businessPlace/widgets/business_place_item.dart';
import 'package:aipetto/modules/businessServiceReservation/bloc/cart/booking_cart_bloc.dart';
import 'package:aipetto/routes/routes.dart';
import 'package:aipetto/utils/constants.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppointmentDetailPage extends StatefulWidget {
  @override
  _AppointmentDetailPageState createState() => _AppointmentDetailPageState();
}

class _AppointmentDetailPageState extends State<AppointmentDetailPage> {

  final bool _isdark = false;

  Color get _color => _isdark ? kColorDark : Colors.white;

  Widget dateAndTime(BookingCartState bookingCart) {
    return Container(
      width: double.infinity,
      color: _color,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(
              height: 15,
            ),
            Text(
              'date_and_time'.tr(),
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w400,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              DateFormat('dd/MM/yyyy').format(bookingCart.dateAvailability).toString() + ', ' + bookingCart.timeAvailability,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 5,
            ),
          ],
        ),
      ),
    );
  }

  Widget practiceDetail(BookingCartState bookingCart, String address, String addressState, String addressZipCode) {
    return Container(
      width: double.infinity,
      color: _color,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(
              height: 15,
            ),
            Text(
              'practice_detail'.tr(),
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w400,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              bookingCart.place.name,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              address + ' - ' + addressState + ' ' + addressZipCode,
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w400,
              ),
            ),
            SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
    );
  }

  Widget procedure(BookingCartState bookingCart) {
    return Container(
      width: double.infinity,
      color: _color,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(
              height: 15,
            ),
            Text(
              'procedure'.tr(),
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w400,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              bookingCart.serviceName,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 5,
            ),
          ],
        ),
      ),
    );
  }

  Widget bookingDetails(BookingCartState bookingCart) {
    return Container(
      width: double.infinity,
      color: _color,
      padding: EdgeInsets.symmetric(
        horizontal: 15,
      ),
      child: Column(
        children: <Widget>[
          SizedBox(
            height: 15,
          ),
          Row(
            children: <Widget>[
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      'booked_for'.tr(),
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      bookingCart.pet.name,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                height: 80,
                child: VerticalDivider(),
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.only(left: 15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        'appointment_id'.tr(),
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        '',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 5,
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    BookingCartState bookingCartState = BlocProvider.of<BookingCartBloc>(context).state;

    final direction = bookingCartState.place.address ?? '';
    final addressNumber = bookingCartState.place.addressNumber ?? '';
    final state = bookingCartState.place.addressState ?? '';
    final addressCity = bookingCartState.place.addressCity ?? '';
    final addressCountry = bookingCartState.place.addressCountry?.name ?? '';
    final zipCode = bookingCartState.place.addressZipCode ?? '';
    final address = direction + ' ' + addressNumber;
    final addressState = state + ' ' + addressCity + ' ' + addressCountry;
    final addressZipCode = zipCode;

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('appointment_details'.tr(),
            style: Theme.of(context)
                .textTheme
                .subtitle1
                ?.copyWith(fontWeight: FontWeight.w700, color: Colors.white)),
        automaticallyImplyLeading: false,
      ),
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Expanded(
              child: Container(
                color: _isdark ? Colors.transparent : Colors.grey[300],
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        color: _isdark ? Colors.transparent : Colors.white,
                        child: BusinessPlaceItem(
                          businessPlace: bookingCartState.place, onTap: () {  }, /// TODO this should come from the state
                        ),
                      ),
                      Divider(
                        color: _isdark ? Colors.black : Colors.grey[300],
                      ),
                      dateAndTime(bookingCartState),
                      Divider(),
                      practiceDetail(bookingCartState, address, addressState, addressZipCode),
                      Divider(),
                      procedure(bookingCartState),
                      Divider(),
                      bookingDetails(bookingCartState),
                      Padding(
                        padding:
                            EdgeInsets.symmetric(vertical: 20, horizontal: 15),
                        child: GestureDetector(
                          onTap: () {
                            Navigator.of(context)
                                .pushNamed(Routes.myAppointments);
                          },
                          child: RichText(
                            text: TextSpan(
                              children: [
                                TextSpan(
                                  text:
                                      '${'manage_you_appointments_better'.tr()} ',
                                  style: TextStyle(
                                    color: Colors.grey[600],
                                    fontSize: 16,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                                TextSpan(
                                  text: 'my_appointments'.tr(),
                                  style: TextStyle(
                                    color: Colors.blue,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w400,
                                    decoration: TextDecoration.underline,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
              child: CustomButton(
                onPressed: () {
                  Navigator.of(context).pushNamed(Routes.home);
                },
                text: 'home'.tr(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
