import 'package:aipetto/modules/business/models/business.dart';
import 'package:aipetto/modules/businessPlace/widgets/business_place_item.dart';
import 'package:aipetto/routes/routes.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class ChooseBusinessPlacePage extends StatefulWidget {
  @override
  _ChooseBusinessPlacePageState createState() =>
      _ChooseBusinessPlacePageState();
}

class _ChooseBusinessPlacePageState extends State<ChooseBusinessPlacePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'businesses'.tr(),
          style: Theme.of(context)
              .textTheme
              .subtitle1
              .copyWith(fontWeight: FontWeight.w700, color: Colors.white),
        ),
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.of(context).pushNamed(Routes.categories);
              },
              tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
            );
          },
        ),
        actions: <Widget>[
          IconButton(
            onPressed: () => Navigator.pushNamed(context, Routes.home),
            icon: Icon(
              Icons.home,
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(20),
              child: Text(
                'choose_a_business_place'.tr(),
                style: Theme.of(context).textTheme.headline6.copyWith(
                      fontWeight: FontWeight.w700,
                    ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            ListView.separated(
              separatorBuilder: (context, index) => Divider(),
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: businesses.length,
              itemBuilder: (context, index) {
                return BusinessPlaceItem(
                  onTap: () {
                    Navigator.of(context)
                        .pushNamed(Routes.bookingStep2DetailsOfPlace);

                    /// TODO pass id selected in the list for the step 2 page
                  },
                  business: businesses[index],
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
