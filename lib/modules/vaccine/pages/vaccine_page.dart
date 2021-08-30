import 'package:aipetto/components/custom_profile_item.dart';
import 'package:aipetto/routes/routes.dart';
import 'package:flutter/material.dart';

import 'package:easy_localization/easy_localization.dart';

class VaccinePage extends StatefulWidget {
  @override
  _VaccinePageState createState() => _VaccinePageState();
}

class _VaccinePageState extends State<VaccinePage>
    with AutomaticKeepAliveClientMixin<VaccinePage> {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            VaccineItem(
              date: 'MAR, 2021',
              time: 'Tue. 17:00',
              child: CustomProfileItem(
                onTap: () {
                  Navigator.of(context).pushNamed(Routes.visitDetail);
                },
                title: 'antirage_vaccine'.tr(),
                subTitle: 'J07BG01',
                buttonTitle: 'details'.tr(),
                imagePath: 'assets/images/syringe.png',
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}

class VaccineItem extends StatelessWidget {
  final String date;
  final String time;
  final Widget child;

  const VaccineItem(
      {Key key, @required this.date, @required this.time, @required this.child})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              date,
              style: Theme.of(context).textTheme.subtitle2.copyWith(
                    fontWeight: FontWeight.w700,
                  ),
            ),
            Text(
              time,
              style: TextStyle(
                color: Colors.grey,
                fontSize: 14,
                fontWeight: FontWeight.w300,
              ),
            )
          ],
        ),
        SizedBox(
          width: 10,
        ),
        Expanded(
          child: child,
        ),
      ],
    );
  }
}
