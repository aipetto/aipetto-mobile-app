import 'package:aipetto/routes/routes.dart';
import 'package:flutter/material.dart';

import '../model/business.dart';
import 'custom_button.dart';

class ReservedPastBussinessListItem extends StatelessWidget {
  final Business business;

  const ReservedPastBussinessListItem({Key key, @required this.business})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 140,
      margin: EdgeInsets.symmetric(vertical: 10),
      padding: EdgeInsets.all(5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
              color: Color(0x0c000000),
              offset: Offset(0, 5),
              blurRadius: 5,
              spreadRadius: 0),
          BoxShadow(
              color: Color(0x0c000000),
              offset: Offset(0, -5),
              blurRadius: 5,
              spreadRadius: 0),
        ],
      ),
      child: Column(
        children: <Widget>[
          CircleAvatar(
            radius: 30,
            backgroundColor: Colors.grey,
            backgroundImage: AssetImage('assets/images/aipetto/place_marker.png'),
          ),
          SizedBox(
            height: 10,
          ),
         CustomButton(
              text: business.name,
              textSize: 14,
              onPressed: () {
                Navigator.of(context).pushNamed(Routes.myAppointments);
              },
              padding: EdgeInsets.symmetric(
                vertical: 10,
                horizontal: 5,
              ),
         )
        ],
      ),
    );
  }
}
