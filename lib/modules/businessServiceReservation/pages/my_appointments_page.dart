import 'package:aipetto/modules/businessServiceReservation/pages/history_appointments_page.dart';
import 'package:aipetto/utils/constants.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import 'upcoming_appointments_page.dart';

class MyAppointmentsPage extends StatefulWidget {
  @override
  _MyAppointmentsPageState createState() => _MyAppointmentsPageState();
}

class _MyAppointmentsPageState extends State<MyAppointmentsPage> {

  final _kTabPages = [
    UpcomingParentAppointsPage(),
    HistoryParentAppointmentsPage(),
  ];

  final _kTabs = [
    Tab(
      text: 'upcoming'.tr(),
    ),
    Tab(
      text: 'history'.tr(),
    ),
  ];
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'my_appointments'.tr(),
          style: Theme.of(context)
              .textTheme
              .subtitle1
              .copyWith(fontWeight: FontWeight.w700, color: Colors.white),
        ),
        elevation: 0,
      ),
      body: DefaultTabController(
          length: _kTabs.length,
          child: Column(
            children: <Widget>[
              TabBar(
                indicatorColor: kColorPrimary,
                labelStyle: kTabTextStyle,
                unselectedLabelStyle: kUnselectedTabTextStyle,
                labelColor: kColorPrimary,
                unselectedLabelColor: Colors.grey,
                tabs: _kTabs,
              ),
              Expanded(
                child: TabBarView(
                  children: _kTabPages,
                ),
              ),
            ],
          ),
        ),
    );
  }
}
