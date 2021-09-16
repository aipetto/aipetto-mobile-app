import 'package:aipetto/components/custom_button.dart';
import 'package:aipetto/components/text_form_field.dart';
import 'package:aipetto/config/pref_manager.dart';
import 'package:aipetto/modules/business/models/business.dart';
import 'package:aipetto/modules/businessPlace/widgets/business_place_item.dart';
import 'package:aipetto/routes/routes.dart';
import 'package:aipetto/utils/constants.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class ReservationCustomerDetailsPage extends StatefulWidget {
  @override
  _ReservationCustomerDetailsPageState createState() => _ReservationCustomerDetailsPageState();
}

class _ReservationCustomerDetailsPageState extends State<ReservationCustomerDetailsPage> {
  bool _isdark = true;
  bool _customer = true;
  var _petNameController = TextEditingController();
  var _customerController = TextEditingController();
  var _phoneController = TextEditingController();
  var _customerPhoneController = TextEditingController();
  var _emailController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _petNameController.text = 'Nombre del pet';
    _customerController.text = 'Nombre del usuário cliente';
    _phoneController.text = '+213781348677';
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

  Color get _color => _isdark ? kColorDark : Colors.white;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'reservation_details'.tr(),
        ),
      ),
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Expanded(
              child: Container(
                //color: _isdark ? Colors.transparent : Colors.grey[300],
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        color: Color(0xff4a4a4a),
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
                                        color: _isdark
                                            ? Colors.black
                                            : Colors.grey,
                                        width: 1),
                                    borderRadius: BorderRadius.circular(4),
                                  ),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      RadioListTile(
                                        value: true,
                                        onChanged: (value) {
                                          setState(() {
                                            _petNameController.text =
                                                'Snoopy';
                                            _customer = true;
                                          });
                                        },
                                        groupValue: _customer,
                                        title: Text('Snoopy'),
                                      ),
                                      Divider(
                                        color: _isdark
                                            ? Colors.black
                                            : Colors.grey,
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
                        padding:
                            EdgeInsets.symmetric(vertical: 20, horizontal: 15),
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
                    ],
                  ),
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
              child: CustomButton(
                onPressed: () {
                  Navigator.of(context).pushNamed(Routes.bookingStepConfirmation);
                },
                text: 'confirm'.tr(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
