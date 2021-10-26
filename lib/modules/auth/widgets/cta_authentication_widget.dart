import 'package:aipetto/components/custom_button.dart';
import 'package:aipetto/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';

class CtaAuthenticationWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: <Widget>[
          Container(
              width: MediaQuery.of(context).size.width,
              margin: EdgeInsets.only(left: 16, right: 16, top: 8, bottom: 16),
              child: CustomButton(
                onPressed: () {
                  Navigator.of(context).pushNamed(Routes.login);
                },
                text: 'sign_in'.tr(),
              )),
        ],
      ),
    );
  }
}
