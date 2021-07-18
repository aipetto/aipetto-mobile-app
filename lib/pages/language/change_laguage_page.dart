import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../data/pref_manager.dart';

enum Language { english, spanish, italian, portuguese }

class ChangeLanguagePage extends StatefulWidget {
  @override
  _ChangeLanguagePageState createState() => _ChangeLanguagePageState();
}

class _ChangeLanguagePageState extends State<ChangeLanguagePage> {
  var _language;
  @override
  void initState() {
    super.initState();
    switch (Prefs.getString('language', def: 'en')) {
      case 'en':
        _language = Language.english;
        break;

      case 'es':
        _language = Language.spanish;
        break;

      case 'pt':
        _language = Language.portuguese;
        break;

      default:
        break;
    }
  }

  _changeLanguage(int index) {
    switch (index) {
      case 0:
        _language = Language.english;
        Prefs.setString(Prefs.LANGUAGE, 'en');
        Prefs.setString(Prefs.LANGUAGE_REGION, 'UK');
        break;

      case 1:
        _language = Language.spanish;
        Prefs.setString(Prefs.LANGUAGE, 'es');
        Prefs.setString(Prefs.LANGUAGE_REGION, 'ES');
        break;

      case 2:
        _language = Language.portuguese;
        Prefs.setString(Prefs.LANGUAGE, 'pt');
        Prefs.setString(Prefs.LANGUAGE_REGION, 'PT');
        break;
    }
    //print("language" + _language.toString());
    context.setLocale(Locale(Prefs.getString(Prefs.LANGUAGE), Prefs.getString(Prefs.LANGUAGE_REGION)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'language_settings'.tr(),
        ),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            RadioListTile(
              value: Language.english,
              onChanged: (value) => _changeLanguage(0),
              groupValue: _language,
              title: Text('english'.tr()),
            ),
            Divider(
              height: 0.5,
              indent: 10,
              endIndent: 10,
            ),
            RadioListTile(
              value: Language.spanish,
              onChanged: (value) => _changeLanguage(1),
              groupValue: _language,
              title: Text('spanish'.tr()),
            ),
            Divider(
              height: 0.5,
              indent: 10,
              endIndent: 10,
            ),
            RadioListTile(
              value: Language.portuguese,
              onChanged: (value) => _changeLanguage(2),
              groupValue: _language,
              title: Text('portuguese'.tr()),
            ),
          ],
        ),
      ),
    );
  }
}
