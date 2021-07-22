import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import 'profile_info_tile.dart';

class InfoWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        ProfileInfoTile(
          title: 'sex'.tr(),
          trailing: 'male'.tr(),
          hint: 'add_sex'.tr(),
        ),
        ProfileInfoTile(
          title: 'date_of_birth'.tr(),
          trailing: null,
          hint: '2014 03 05',
        ),
        ProfileInfoTile(
          title: 'weight'.tr(),
          trailing: null,
          hint: '45 Kg',
        ),
      ],
    );
  }
}
