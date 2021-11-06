import 'package:aipetto/modules/business/widgets/business_list_item.dart';
import 'package:aipetto/modules/businessPlace/models/business_place.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class MyFavoriteBusinessessListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('my_favorite_business_places'.tr(),
            style: Theme.of(context)
                .textTheme
                .subtitle1
                .copyWith(fontWeight: FontWeight.w700, color: Colors.white)),
      ),
      body: ListView.separated(
        separatorBuilder: (context, index) => SizedBox(
          height: 15,
        ),
        itemCount: 1,
        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 25),
        itemBuilder: (context, index) {
          return MyBusinessListItem(
            businessPlace: businessesPlaces[index],
          );
        },
      ),
    );
  }
}
