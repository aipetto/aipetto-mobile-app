import 'package:aipetto/config/pref_manager.dart';
import 'package:aipetto/modules/settings/widgets/account_widget.dart';
import 'package:aipetto/modules/settings/widgets/general_widget.dart';
import 'package:aipetto/modules/settings/widgets/settings_widget.dart';
import 'package:aipetto/utils/constants.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class SettingsPage extends StatefulWidget {
  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage>
    with AutomaticKeepAliveClientMixin<SettingsPage> {
  bool _isDark = true;
  Color _color;

  @override
  void initState() {
    super.initState();
    _color = _isDark ? kColorDark : Colors.grey[50];
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            'settings'.tr(),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SettingsWidget(
                color: _color,
              ),
              GeneralWidget(isDark: _isDark),
              AccountWidget(
                color: _color,
              ),
              SizedBox(
                height: kBottomPadding,
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
