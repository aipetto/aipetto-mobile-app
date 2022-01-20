import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';

enum Availability { anyDay, today, next3Days, commingWeekend }

class AvailabilityWidget extends StatefulWidget {
  final Color color;

  const AvailabilityWidget({required this.color});
  @override
  _AvailabilityWidgetState createState() => _AvailabilityWidgetState();
}

class _AvailabilityWidgetState extends State<AvailabilityWidget> {
  Availability _availability = Availability.anyDay;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
          width: double.infinity,
          color: widget.color,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
            child: Text(
              'availability'.tr(),
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
        ),
        RadioListTile(
          value: Availability.anyDay,
          onChanged: (value) {
            setState(() {
              _availability = value as Availability;
            });
          },
          groupValue: _availability,
          title: Text('available_any_day'.tr()),
        ),
        RadioListTile(
          value: Availability.today,
          onChanged: (value) {
            setState(() {
              _availability = value as Availability;
            });
          },
          groupValue: _availability,
          title: Text('available_today'.tr()),
        ),
        RadioListTile(
          value: Availability.next3Days,
          onChanged: (value) {
            setState(() {
              _availability = value as Availability;
            });
          },
          groupValue: _availability,
          title: Text('available_in_next_3_days'.tr()),
        ),
        RadioListTile(
          value: Availability.commingWeekend,
          onChanged: (value) {
            setState(() {
              _availability = value as Availability;
            });
          },
          groupValue: _availability,
          title: Text('available_coming_weekend'.tr()),
        )
      ],
    );
  }
}
