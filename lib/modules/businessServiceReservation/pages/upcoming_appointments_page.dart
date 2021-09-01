import 'package:aipetto/components/upcoming_appointment_list_item.dart';
import 'package:flutter/material.dart';

class UpcomingAppointmentsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      separatorBuilder: (context, index) => SizedBox(
        height: 15,
      ),
      itemCount: 1,
      padding: EdgeInsets.symmetric(
        vertical: 35,
        horizontal: 15,
      ),
      itemBuilder: (context, index) {
        return UpcomingAppointmentListItem();
      },
    );
  }
}