import 'dart:async';

import 'package:aipetto/routes/routes.dart';
import 'package:aipetto/utils/constants.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

class SplashPage extends StatefulWidget {
  final String? redirect_route;

  const SplashPage({this.redirect_route});

  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    _loadScreen(context);
  }

  _loadScreen(BuildContext context) async {
    SchedulerBinding.instance?.addPostFrameCallback((_) {
      Navigator.of(context).pushReplacementNamed(widget.redirect_route ?? Routes.home);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        color: kColorBlueAnimation,
        child: Column(
          children: <Widget>[
            Expanded(
              flex: 3,
              child: Container(),
            ),
            Center(
              child: Image.asset('assets/images/animations/petAnimationComputer.gif',
                  height: 250,
                  width: MediaQuery.of(context).size.width,
                  fit: BoxFit.contain),
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
                                fontSize: 45,
                                fontWeight: FontWeight.w900,
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
                backgroundColor: kAmphibianColorGreenLight,
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
