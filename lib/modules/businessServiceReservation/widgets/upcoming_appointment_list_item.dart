import 'package:aipetto/modules/businessServiceReservation/models/service_reservation.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../../components/custom_button.dart';
import '../../../components/custom_outline_button.dart';

class UpcomingAppointmentListItem extends StatelessWidget {

  final Reservation reservation;

  const UpcomingAppointmentListItem({Key key, this.reservation}) : super(key: key);

  @override
  Widget build(BuildContext context) {
      return Card(
             child: Row(
               children: <Widget>[
                 Expanded(
                   flex: 2,
                   child: Column(
                     crossAxisAlignment: CrossAxisAlignment.start,
                     children: <Widget>[
                       SizedBox(
                         height: 20,
                       ),
                       Padding(
                         padding: const EdgeInsets.symmetric(horizontal: 15),
                         child: Row(
                           crossAxisAlignment: CrossAxisAlignment.start,
                           children: <Widget>[
                             Expanded(
                               child: _buildColumn(
                                 context: context,
                                 title: 'date'.tr(),
                                 subtitle: reservation.date.toString()
                               ),
                             ),
                             SizedBox(
                               width: 10,
                             ),
                             Expanded(
                               child: _buildColumn(
                                 context: context,
                                 title: 'time'.tr(),
                                 subtitle: reservation.time,
                               ),
                             ),
                           ],
                         ),
                       ),
                       SizedBox(
                         height: 15,
                       ),
                       Divider(
                         height: 1,
                         thickness: 1,
                         indent: 10,
                         endIndent: 10,
                       ),
                       Padding(
                         padding: const EdgeInsets.all(15),
                         child: Row(
                           crossAxisAlignment: CrossAxisAlignment.start,
                           children: <Widget>[
                             Expanded(
                               child: _buildColumn(
                                 context: context,
                                 title: 'veterinarian'.tr(),
                                 subtitle: ''///reservation.serviceProviderIDs.first.toString(),
                               ),
                             ),
                             Expanded(
                               child: _buildColumn(
                                 context: context,
                                 title: 'speciality'.tr(),
                                 subtitle: reservation.serviceType.first.name,
                               ),
                             ),
                           ],
                         ),
                       ),
                     ],
                   ),
                 ),
                 SizedBox(
                   width: 10,
                 ),
                 Expanded(
                   child: Padding(
                     padding: const EdgeInsets.only(right: 15),
                     child: Column(
                       children: <Widget>[
                         Container(
                           width: double.infinity,
                           child: CustomButton(
                             text: 'reschedule'.tr(),
                             textSize: 14,
                             onPressed: () {},
                             padding: EdgeInsets.symmetric(
                               vertical: 10,
                             ),
                           ),
                         ),
                         SizedBox(
                           height: 25,
                         ),
                         Container(
                           width: double.infinity,
                           child: CustomOutlineButton(
                             text: 'cancel'.tr(),
                             textSize: 14,
                             onPressed: () {},
                             padding: EdgeInsets.symmetric(
                               vertical: 10,
                             ),
                           ),
                         ),
                       ],
                     ),
                   ),
                 )
               ],
             ),
           );
      }

  Column _buildColumn({
    @required BuildContext context,
    @required String title,
    @required subtitle,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Text(
          title,
          style: TextStyle(
            color: Colors.grey,
            fontSize: 14,
            fontWeight: FontWeight.w400,
          ),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        Text(
          subtitle,
          style: Theme.of(context)
              .textTheme
              .subtitle1
              .copyWith(fontWeight: FontWeight.w500),
        ),
      ],
    );
  }
}
