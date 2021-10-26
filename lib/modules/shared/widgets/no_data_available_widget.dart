import 'package:aipetto/utils/constants.dart';
import 'package:flutter/material.dart';

class NoDataAvailableWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
      children: <Widget>[
        SizedBox(
          height: 20,
        ),
        Image.asset('assets/images/pet_sick_icon.png'),
        SizedBox(
          height: 10,
        ),
        Text(
          'Woof Woof',
          style: TextStyle(
            color: kColorDarkBlue,
            fontSize: 20,
            fontFamily: 'NunitoSans',
            fontWeight: FontWeight.w700,
          ),
        ),
      ],
    ));
  }
}
