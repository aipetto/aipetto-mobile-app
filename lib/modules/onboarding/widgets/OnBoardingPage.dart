import 'package:aipetto/config/pref_manager.dart';
import 'package:aipetto/modules/i18n/models/Language.dart';
import 'package:aipetto/routes/routes.dart';
import 'package:aipetto/utils/constants.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';

class OnBoardingPage extends StatefulWidget {
  @override
  _OnBoardingPageState createState() => _OnBoardingPageState();
}

class _OnBoardingPageState extends State<OnBoardingPage> {
  final introKey = GlobalKey<IntroductionScreenState>();
  var _language;

  void _onIntroEnd(context) {
    Navigator.of(context).pushNamed(Routes.home);
  }

  @override
  void initState() {
    super.initState();

    switch (Prefs.getString('language', def: 'pt')) {
      case 'pt':
        _language = Language.portuguese;
        break;

      case 'en':
        _language = Language.english;
        break;

      case 'es':
        _language = Language.spanish;
        break;

      default:
        break;
    }
  }

  _changeLanguage(int index) {
    switch (index) {
      case 0:
        _language = Language.portuguese;
        Prefs.setString(Prefs.LANGUAGE, 'pt');
        Prefs.setString(Prefs.LANGUAGE_REGION, 'BR');
        Prefs.setString(Prefs.LANGUAGE_ID, '6096a50ab5704301f1e7b535');
        break;

      case 1:
        _language = Language.english;
        Prefs.setString(Prefs.LANGUAGE, 'en');
        Prefs.setString(Prefs.LANGUAGE_REGION, 'UK');
        Prefs.setString(Prefs.LANGUAGE_ID, '6096a50fb57043bb3ae7b537');
        break;

      case 2:
        _language = Language.spanish;
        Prefs.setString(Prefs.LANGUAGE, 'es');
        Prefs.setString(Prefs.LANGUAGE_REGION, 'AR');
        Prefs.setString(Prefs.LANGUAGE_ID, '6096a507b570431faae7b533');
        break;
    }
    context.setLocale(Locale(Prefs.getString(Prefs.LANGUAGE),
        Prefs.getString(Prefs.LANGUAGE_REGION)));
  }

  @override
  Widget build(BuildContext context) {
    const bodyStyle = TextStyle(fontSize: 19.0);

    const pageDecoration = const PageDecoration(
      titleTextStyle: TextStyle(fontSize: 28.0, fontWeight: FontWeight.w700),
      bodyTextStyle: bodyStyle,
      descriptionPadding: EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 16.0),
      pageColor: Colors.white,
      imagePadding: EdgeInsets.zero,
    );

    return IntroductionScreen(
      key: introKey,
      globalBackgroundColor: Colors.white,
      globalHeader: Align(alignment: Alignment.topRight),
      globalFooter: SizedBox(
        width: double.infinity,
        height: 60,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(primary: kAmphibianColorGreenLight),
          child: const Text(
            'Start',
            style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
          ),
          onPressed: () => _onIntroEnd(context),
        ),
      ),
      pages: [
        PageViewModel(
          title: 'onboarding_find_services_one_place'.tr(),
          bodyWidget: Column(
            children: <Widget>[
              RadioListTile(
                value: Language.portuguese,
                onChanged: (value) => _changeLanguage(0),
                groupValue: _language,
                title: Text('portuguese'.tr()),
              ),
              Divider(
                height: 0.0,
                indent: 10,
                endIndent: 10,
              ),
              RadioListTile(
                value: Language.english,
                onChanged: (value) => _changeLanguage(1),
                groupValue: _language,
                title: Text('english'.tr()),
              ),
              Divider(
                height: 0.0,
                indent: 10,
                endIndent: 10,
              ),
              RadioListTile(
                value: Language.spanish,
                onChanged: (value) => _changeLanguage(2),
                groupValue: _language,
                title: Text('spanish'.tr()),
              ),
              SizedBox(
                height: 30,
              ),
              SizedBox(
                height: 20,
              ),
            ],
          ),
          image: Image.asset('assets/images/dog-house.jpg', width: 250),
          decoration: pageDecoration,
        ),
        PageViewModel(
          title: 'take_pet_profile_everywhere'.tr(),
          body: 'control_pet_vaccines_exams'.tr(),
          image: Image.asset('assets/images/veterinarians.jpg', width: 250),
          decoration: pageDecoration,
        ),
        PageViewModel(
          title: 'all_about_pets'.tr(),
          body: '',
          image: Image.asset('assets/images/owl-300.jpg', width: 200),
          footer: ElevatedButton(
            onPressed: () {
              Navigator.of(context).pushReplacementNamed(Routes.chatAI);
            },
            child: Text('ask_anything'.tr(),
              style: TextStyle(color: Colors.black),
            ),
            style: ElevatedButton.styleFrom(
              primary: kAmphibianColorGreenLight,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0),
              ),
            ),
          ),
          decoration: pageDecoration,
        )
      ],
      onDone: () => _onIntroEnd(context),
      //onSkip: () => _onIntroEnd(context),
      showSkipButton: true,
      skipFlex: 0,
      nextFlex: 0,
      skip: Text('onboarding_skip'.tr()),
      next: const Icon(Icons.arrow_forward),
      done: Text('onboarding_done'.tr(), style: TextStyle(fontWeight: FontWeight.w600)),
      curve: Curves.fastLinearToSlowEaseIn,
      controlsMargin: const EdgeInsets.all(0),
      controlsPadding: kIsWeb
          ? const EdgeInsets.all(12.0)
          : const EdgeInsets.fromLTRB(8.0, 4.0, 8.0, 4.0),
      dotsDecorator: const DotsDecorator(
        size: Size(10.0, 10.0),
        color: Color(0xFFBDBDBD),
        activeSize: Size(22.0, 10.0),
        activeShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(25.0)),
        ),
      ),
      dotsContainerDecorator: const ShapeDecoration(
        color: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(8.0)),
        ),
      ),
    );
  }
}
