import 'package:aipetto/components/custom_button.dart';
import 'package:aipetto/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';

import '../../../utils/constants.dart';

class NoAppointmentsWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: <Widget>[
          SizedBox(
            height: 20,
          ),
          Image.asset('assets/images/icon_no_appointments.png'),
          SizedBox(
            height: 10,
          ),
          Text(
            'there_is_no_appontments'.tr(),
            style: TextStyle(
              color: kAmphibianColorBlueLight,
              fontSize: 20,
              fontFamily: 'NunitoSans',
              fontWeight: FontWeight.w700,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
              width: MediaQuery.of(context).size.width,
              margin: EdgeInsets.only(left: 16, right: 16, top: 8, bottom: 16),
              child: CustomButton(
                onPressed: () {
                  Navigator.of(context).pushNamed(Routes.categories);
                },
                text: 'reserve'.tr(),
              )),
        ],
      ),
    );
  }
}
