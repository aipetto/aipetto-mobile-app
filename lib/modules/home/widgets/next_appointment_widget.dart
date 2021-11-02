import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../../components/round_icon_button.dart';
import '../../../utils/constants.dart';

class NextAppointmentWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4),
        color: kAmphibianColorBlueLight,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            children: <Widget>[
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      'choose_pet_service'.tr(),
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 25,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
              ),
              RoundIconButton(
                onPressed: () {},
                icon: Icons.pets,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
