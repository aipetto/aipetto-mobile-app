import 'package:aipetto/modules/pet/models/pets.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import 'profile_info_tile.dart';

class InfoWidget extends StatelessWidget {

  final Pet? pet;

  const InfoWidget({this.pet});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        ProfileInfoTile(
          title: 'sex'.tr(),
          itemData: pet!.sex,
          boolItemData: false,
        ),
        ProfileInfoTile(
          title: 'age_months'.tr(),
          itemData: pet!.age.toString(),
          boolItemData: false,
        ),
        ProfileInfoTile(
          title: 'date_of_birth'.tr(),
          itemData: pet?.birthdate != null ? DateFormat('dd/MM/yyyy').format(pet!.birthdate) : '',
          boolItemData: false,
        ),
        ProfileInfoTile(
          title: 'weight'.tr(),
          itemData: pet!.weight,
          boolItemData: false,
        ),
        ProfileInfoTile(
          title: 'hasMicrochip'.tr(),
          boolItemData: pet?.hasMicrochip ?? false,
          itemData: '',
        ),
        ProfileInfoTile(
          title: 'hasBeenVaccinated'.tr(),
          boolItemData: pet?.hasBeenVaccinated ?? false,
          itemData: '',
        ),
        ProfileInfoTile(
          title: 'hasBeenDewormed'.tr(),
          boolItemData: pet?.hasBeenDewormed ?? false,
          itemData: '',
        ),
        ProfileInfoTile(
          title: 'hasBeenSterializedSpayed'.tr(),
          boolItemData: pet?.hasBeenSterilizedSpayed ?? false,
          itemData: '',
        ),
        ProfileInfoTile(
          title: 'isGuideDog'.tr(),
          boolItemData: pet?.isGuideDog ?? false,
          itemData: '',
        ),
        ProfileInfoTile(
          title: 'isLost'.tr(),
          boolItemData: pet?.isLost ?? false,
          itemData: '',
        ),
      ],
    );
  }
}
