import 'package:aipetto/components/custom_button.dart';
import 'package:aipetto/components/text_form_field.dart';
import 'package:aipetto/modules/auth/bloc/authentication.dart';
import 'package:aipetto/modules/business/models/business.dart';
import 'package:aipetto/modules/businessPlace/widgets/business_place_item.dart';
import 'package:aipetto/modules/businessServiceReservation/bloc/confirmation/service_reservation_confirmation_form_bloc.dart';
import 'package:aipetto/modules/businessServiceReservation/models/service_reservation.dart';
import 'package:aipetto/routes/routes.dart';
import 'package:aipetto/utils/constants.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ConfirmationServiceReservationWidget extends StatefulWidget {
  /// TODO Until we see a better solution (using Stream which can be accessed anytime), this will be work in cascade mode
  /// Passing data between pages from top of Widgets down the tree

  // Page 1
  // Lat, Lng Get Address from Address Page or User Lng, Lat
  // serviceReservationCart.copyWith(a)
  // =====Page 2=====
  // placeId
  // businessId -> testTenantId 61096ec884e5ebfca16f0143
  //serviceReservationCart.copyWith(...,b,c)
  // =====Page 3=====
  // serviceId
  //serviceReservationCart.copyWith(...,c)

  // =====AuthCheckerPage=====

  // =====Page 4=====
  // timeAvailability
  // dateAvailability
  // serviceReservationCart.copyWith(...,d, e)
  // =====Page 5=====
  // serviceReservationCart.copyWith(...,customerName, customerEmail(checkIfExistInBusinessTenant), customerPhone, petModel(checkIfExistInBusinessTenantPetIdisUnique))
  // (POST serviceReservationCart)

  @override
  State<StatefulWidget> createState() =>
      _ConfirmationServiceReservationWidgetState();
}

class _ConfirmationServiceReservationWidgetState
    extends State<ConfirmationServiceReservationWidget> {
  final GlobalKey<FormState> _key = GlobalKey<FormState>();
  final _customerName = TextEditingController();

  final _petNameController = TextEditingController();
  final _customerController = TextEditingController();
  final _phoneController = TextEditingController();
  final _customerPhoneController = TextEditingController();
  final _emailController = TextEditingController();
  bool _isdark = false;
  bool _customer = true;

  Color get _color => _isdark ? kColorDark : Colors.white;

  @override
  void initState() {
    super.initState();
    _petNameController.text = 'Nombre del pet';
    _customerController.text = 'Nombre del usuário cliente';
    _phoneController.text = '+213781348677';
  }

  @override
  Widget build(BuildContext context) {
    final _serviceReservationConfirmationBloc =
        BlocProvider.of<ServiceReservationConfirmationFormBloc>(context);
    final AuthenticationState currentUser =
        BlocProvider.of<AuthenticationBloc>(context).state;

    _onConfirmationFormButtonPressed() {
      if (_key.currentState.validate()) {
        if (currentUser is AuthenticationAuthenticated) {
          final reservation = new Reservation(
              serviceType: <ServiceType>[
                new ServiceType(
                    id: '6133b1626a2c375bfcc14f27', name: 'Vacinação')
              ],
              businessId: '610cbc1212bcbd59074e84fa',
              place: '610cb9c812bcbd22144e84f8',
              date: DateTime.parse('2021-11-02'),
              totalPrice: 150,
              time: "08_00AM",
              customerTenant: '61399582b3bcce39758baf74', // elephwebb@gmail.com
              tenant: '61096ec884e5ebfca16f0143', // aipetto@aipetto.com
              createdBy: currentUser.user.id,
              updatedBy: currentUser.user.id,
              source: 'aipetto_app');

          _serviceReservationConfirmationBloc.add(
              NewServiceReservationConfirmationFormButtonPressed(
                  reservation: reservation,
                  businessPlaceTenantId: '61096ec884e5ebfca16f0143',
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
                  business: businesses[0],
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
                        'antirage_vaccine'.tr(),
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
                        '${'tomorrow'.tr()}, 8:30 AM',
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
                                    _customer = true;
                                  });
                                },
                                groupValue: _customer,
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
                                    _customer = false;
                                  });
                                },
                                groupValue: _customer,
                                title: Text('someone_else'.tr()),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      _userDetails(),
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

  Widget _userDetails() {
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
        ),
        CustomTextFormField(
          controller: _customerController,
          hintText: _customer ? '' : 'Cliente ABC',
        ),
        SizedBox(
          height: 15,
        ),
        Text(
          '${'mobile'.tr()}*',
          style: kInputTextStyle,
        ),
        CustomTextFormField(
          controller: _phoneController,
          hintText: '+213781348677',
          enabled: false,
        ),
        _customer ? Container() : _customersMobile(),
        SizedBox(
          height: 15,
        ),
        Text(
          _customer ? '${'your_email'.tr()}*' : '${'customer_email'.tr()}*',
          style: kInputTextStyle,
        ),
        CustomTextFormField(
          controller: _emailController,
          hintText: _customer
              ? 'enter_your_email_id'.tr()
              : 'enter_customer_email_id'.tr(),
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
