import 'package:flutter/material.dart';

import '../utils/constants.dart';

class TimeSlotItem extends StatelessWidget {
  final String time;
  final Function onTap;

  const TimeSlotItem({Key key, @required this.time, @required this.onTap})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(4),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey, width: 2),
          borderRadius: BorderRadius.circular(4),
        ),
        child: Column(
          children: <Widget>[
            Text(
              time,
              style: TextStyle(
                color: kAmphibianColorBlueDarkAlternative,
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
