import 'package:aipetto/components/custom_button.dart';
import 'package:aipetto/utils/constants.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import 'widgets/widgets.dart';

class FilterPage extends StatefulWidget {
  @override
  _FilterPageState createState() => _FilterPageState();
}

class _FilterPageState extends State<FilterPage> {
  final bool _isDark = false;
  Color? _color;

  @override
  void initState() {
    super.initState();
    _color = _isDark ? kColorDark : Colors.grey;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kAmphibianColorGreenLight,
        title: Text(
          'filter'.tr(),
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        iconTheme: IconThemeData(
          color: Colors.white,
        ),
      ),
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Expanded(
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    SortWidget(
                      color: _color as Color,
                    ),
                    AvailabilityWidget(
                      color: _color as Color,
                    ),
                    SexWidget(
                      color: _color as Color,
                    ),
                    ConsultationFeeWidget(
                      color: _color as Color,
                    ),
                  ],
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
              child: CustomButton(
                onPressed: () {},
                text: 'apply'.tr(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
