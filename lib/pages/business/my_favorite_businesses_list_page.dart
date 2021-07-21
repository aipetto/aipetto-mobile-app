import 'package:aipetto/components/my_business_list_item.dart';
import 'package:aipetto/model/business.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class MyFavoriteBusinessessListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'my_favorite_business_places'.tr(),
        ),
      ),
      body: ListView.separated(
        separatorBuilder: (context, index) => SizedBox(
          height: 15,
        ),
        itemCount: 3,
        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 25),
        itemBuilder: (context, index) {
          return MyBusinessListItem(
            business: businesses[index],
          );
        },
      ),
    );
  }
}
