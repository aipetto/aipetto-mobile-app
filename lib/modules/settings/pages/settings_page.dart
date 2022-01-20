import 'package:aipetto/modules/settings/widgets/account_widget.dart';
import 'package:aipetto/modules/settings/widgets/general_widget.dart';
import 'package:aipetto/modules/settings/widgets/settings_widget.dart';
import 'package:aipetto/utils/constants.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:package_info/package_info.dart';

class SettingsPage extends StatefulWidget {
  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage>
    with AutomaticKeepAliveClientMixin<SettingsPage> {

  PackageInfo _packageInfo = PackageInfo(
    appName: 'Unknown',
    packageName: 'Unknown',
    version: 'Unknown',
    buildNumber: 'Unknown',
  );

  bool _isDark = false;
  Color? _color;

  @override
  void initState() {
    super.initState();
    _initPackageInfo();
    _color = _isDark ? kColorDark : Colors.grey[50];
  }

  Future<void> _initPackageInfo() async {
    final PackageInfo info = await PackageInfo.fromPlatform();
    setState(() {
      _packageInfo = info;
    });
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('settings'.tr(),
              style: Theme.of(context)
                  .textTheme
                  .subtitle1
                  ?.copyWith(fontWeight: FontWeight.w700, color: Colors.white)),
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
              Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Spacer(),
                    Text(_packageInfo.appName, style: TextStyle(color: Colors.black),),
                    Spacer(
                      flex: 4,
                    ),
                    Text('v${_packageInfo.version}', style: TextStyle(color: Colors.black),),
                    Spacer(),
                  ])
            ],
          ),
        ),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
