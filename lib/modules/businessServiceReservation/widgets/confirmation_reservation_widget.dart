import 'package:aipetto/components/custom_button.dart';
import 'package:aipetto/components/text_form_field.dart';
import 'package:aipetto/modules/auth/bloc/authentication.dart';
import 'package:aipetto/modules/businessPlace/models/business_place.dart';
import 'package:aipetto/modules/businessPlace/widgets/business_place_item.dart';
import 'package:aipetto/modules/businessServiceReservation/bloc/cart/booking_cart_bloc.dart';
import 'package:aipetto/modules/businessServiceReservation/bloc/confirmation/service_reservation_confirmation_form_bloc.dart';
import 'package:aipetto/modules/businessServiceReservation/models/service_reservation.dart';
import 'package:aipetto/modules/user/models/user.dart';
import 'package:aipetto/routes/routes.dart';
import 'package:aipetto/utils/constants.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ConfirmationServiceReservationWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() =>
      _ConfirmationServiceReservationWidgetState();
}

class _ConfirmationServiceReservationWidgetState
    extends State<ConfirmationServiceReservationWidget> {
  final GlobalKey<FormState> _key = GlobalKey<FormState>();

  final _petNameController = TextEditingController();
  final _customerNameController = TextEditingController();
  final _customerEmailController = TextEditingController();
  final _customerPhoneController = TextEditingController();
  final _emailController = TextEditingController();
  User authenticatedUser;
  bool _isdark = false;
  bool _customer = true;
  bool _pet = true;

  Color get _color => _isdark ? kColorDark : Colors.white;

  @override
  void initState() {
    super.initState();
    _petNameController.text = '';
    _customerNameController.text = '';
    _customerEmailController.text = '';
    _customerPhoneController.text = '';
  }

  @override
  Widget build(BuildContext context) {
    final _serviceReservationConfirmationBloc = BlocProvider.of<ServiceReservationConfirmationFormBloc>(context);
    final AuthenticationState currentUser = BlocProvider.of<AuthenticationBloc>(context).state;

    final BookingCartState bookingCartState = BlocProvider.of<BookingCartBloc>(context).state;

    if (currentUser is AuthenticationAuthenticated) {
      authenticatedUser = currentUser.user;
    }

    _onConfirmationFormButtonPressed() {
      if (_key.currentState.validate()
          && _customerEmailController.text != ''
          && _customerNameController.text != ''
          && _customerPhoneController.text != ''
      ) {
        if (currentUser is AuthenticationAuthenticated) {
          final reservation = new Reservation(
              serviceType: <ServiceType>[
                new ServiceType(
                    id: bookingCartState.serviceId
                )
              ],
              businessId: bookingCartState.place.businessId.id,
              place: bookingCartState.place.id,
              date: bookingCartState.dateAvailability,
              totalPrice: bookingCartState.totalServicePrice,
              time: bookingCartState.timeAvailability,
              customerTenant: currentUser.user.tenants.first.tenant.id,
              tenant: bookingCartState.place.tenant,
              createdBy: currentUser.user.id,
              updatedBy: currentUser.user.id,
              source: 'aipetto_app');

          _serviceReservationConfirmationBloc.add(
              NewServiceReservationConfirmationFormButtonPressed(
                  reservation: reservation,
                  businessPlaceTenantId:  bookingCartState.place.tenant,
                  user: currentUser.user));
        }
      }
    }

    return BlocListener<ServiceReservationConfirmationFormBloc,
        ServiceReservationConfirmationFormState>(
      listener: (context, state) {
        if (state is ServiceReservationFormSuccess) {
          Navigator.of(context).pushNamed(Routes.bookingStepConfirmation);
        }
      },
      child: BlocBuilder<ServiceReservationConfirmationFormBloc,
          ServiceReservationConfirmationFormState>(builder: (context, state) {
        return Form(
          key: _key,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                color: Colors.white,
                child: BusinessPlaceItem(
                  businessPlace: staticBusinessesPlaces[0],
                ),
              ),
              Divider(
                color: _isdark ? Colors.black : Colors.grey[300],
                height: 0.5,
              ),
              Container(
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
                        'purpose_of_visit'.tr(),
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      Text(
                        bookingCartState.serviceName,
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                    ],
                  ),
                ),
              ),
              Divider(),
              Container(
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
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      Text(
                        DateFormat('dd/MM/yyyy').format(bookingCartState.dateAvailability).toString() + ', ' + bookingCartState.timeAvailability,
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
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                width: double.infinity,
                color: _color,
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 15,
                    vertical: 15,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        'this_appointment_for_dot'.tr(),
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Material(
                        color: _isdark
                            ? Colors.white.withOpacity(0.12)
                            : Colors.white,
                        borderRadius: BorderRadius.circular(4),
                        child: Container(
                          decoration: BoxDecoration(
                            border: Border.all(
                                color: _isdark ? Colors.black : Colors.grey,
                                width: 1),
                            borderRadius: BorderRadius.circular(4),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              RadioListTile(
                                value: true,
                                onChanged: (value) {
                                  setState(() {
                                    _petNameController.text = 'Snoopy';
                                    _pet = true;
                                  });
                                },
                                groupValue: _pet,
                                title: Text('Snoopy'),
                              ),
                              Divider(
                                color: _isdark ? Colors.black : Colors.grey,
                                height: 1,
                              ),
                              RadioListTile(
                                value: false,
                                onChanged: (value) {
                                  setState(() {
                                    _petNameController.clear();
                                    _pet = false;
                                  });
                                },
                                groupValue: _pet,
                                title: Text('someone_else'.tr()),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      _customerDetails(authenticatedUser.firstName, authenticatedUser.email),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 20, horizontal: 15),
                child: RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: '${'booking_agreement'.tr()} ',
                        style: TextStyle(
                          color: Colors.grey[600],
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      TextSpan(
                        text: 't_and_c'.tr(),
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
              Container(
                padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                child: CustomButton(
                  onPressed: state is ServiceReservationFormLoading
                      ? () {}
                      : _onConfirmationFormButtonPressed,
                  text: 'confirm'.tr(),
                ),
              ),
            ],
          ),
        );
      }),
    );
  }

  Widget _customerDetails(String customerNameFromAuth, String customerEmailFromAuth) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          _customer
              ? '${'please_provide_following_information_about'.tr()}:'
              : 'please_provide_following_customer_details_dot'.tr(),
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(
          height: 35,
        ),
        Text(
          _customer ? '${'full_name'.tr()}*' : '${'customer_full_name'.tr()}*',
          style: TextStyle(
            color: Colors.black,
            fontSize: 18,
            fontFamily: 'NunitoSans',
            fontWeight: FontWeight.w400,
          ),
        ),
        CustomTextFormField(
          controller: _customerNameController,
          hintText: _customer ?? customerNameFromAuth,
        ),
        SizedBox(
          height: 15,
        ),
        Text(
          '${'customer_email'.tr()}*',
          style: TextStyle(
            color: Colors.black,
            fontSize: 18,
            fontFamily: 'NunitoSans',
            fontWeight: FontWeight.w400,
          ),
        ),
        CustomTextFormField(
          controller: _customerEmailController,
          hintText: _customer ?? customerEmailFromAuth,
          enabled: true,
        ),
        SizedBox(
          height: 15,
        ),
        Text(
          '${'mobile'.tr()}*',
            style: TextStyle(
              color: Colors.black,
              fontSize: 18,
              fontFamily: 'NunitoSans',
              fontWeight: FontWeight.w400,
            ),
        ),
        CustomTextFormField(
          controller: _customerPhoneController,
          hintText: '',
          enabled: true,
        ),
        _customer ? Container() : _customersMobile(),
        SizedBox(
          height: 15,
        ),
      ],
    );
  }

  Widget _customersMobile() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        SizedBox(
          height: 15,
        ),
        Text(
          'Mobile number',
          style: kInputTextStyle,
        ),
        CustomTextFormField(
          controller: _customerPhoneController,
          hintText: 'Enter Mobile Number',
        ),
      ],
    );
  }
}
