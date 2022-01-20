import 'package:aipetto/components/custom_button.dart';
import 'package:aipetto/routes/routes.dart';
import 'package:aipetto/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';

class NeedAddressToContinuePage extends StatelessWidget {
  const NeedAddressToContinuePage();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        automaticallyImplyLeading: false,
        actions: <Widget>[
          IconButton(
            onPressed: () => Navigator.pushNamed(context, Routes.home),
            icon: Icon(
              Icons.home,
            ),
          )
        ],
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 20,
            ),
            Image.asset('assets/images/pet_sick_icon.png'),
            SizedBox(
              height: 10,
            ),
            Text(
              'need_address'.tr(),
              style: TextStyle(
                color: kColorDarkBlue,
                fontSize: 20,
                fontFamily: 'NunitoSans',
                fontWeight: FontWeight.w700,
              ),
            ),
            Container(
                width: MediaQuery.of(context).size.width,
                margin: EdgeInsets.only(left: 16, right: 16, top: 8, bottom: 16),
                child: CustomButton(
                  onPressed: () {
                    Navigator.of(context).pushNamed(Routes.accessGPS);
                  },
                  text: 'location'.tr(),
                )),
          ],
        ),
      ),
   );
  }
}
