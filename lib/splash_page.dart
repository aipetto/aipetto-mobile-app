import 'dart:async';

import 'package:aipetto/routes/routes.dart';
import 'package:aipetto/utils/constants.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class SplashPage extends StatefulWidget {
  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {

  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 2), () => {_loadScreen()});
  }

  _loadScreen() async {

    /**
     context.bloc<ThemeBloc>().add(ThemeChanged(
        theme: AppTheme.DarkTheme
    ));**/

    Navigator.of(context).pushReplacementNamed(Routes.home);
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Container(
        width: double.infinity,
        color: kColorDarkBlue,
        child: Column(
          children: <Widget>[
            Expanded(
              flex: 3,
              child: Container(),
            ),
            Center(
                child: Image.asset("assets/images/logos/aipetto-logo-transparent.png",
                    height: 250,
                    width: MediaQuery.of(context).size.width,
                    fit: BoxFit.contain
                ),
              ),
            Expanded(
              flex: 3,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Text.rich(
                        TextSpan(
                          children: [
                            TextSpan(
                              text: 'app_name'.tr(),
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 42,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Container(
              width: 150,
              height: 2,
              child: LinearProgressIndicator(
                backgroundColor:kAmphibianColorGreenLight,
                valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
              ),
            ),
            Expanded(
              flex: 1,
              child: Container(),
            )
          ],
         ),
      ),
    );
  }
}
