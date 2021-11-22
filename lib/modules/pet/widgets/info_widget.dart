import 'package:aipetto/modules/pet/models/pets.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import 'profile_info_tile.dart';

class InfoWidget extends StatelessWidget {

  final Pet pet;

  const InfoWidget({Key key, this.pet}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        ProfileInfoTile(
          title: 'sex'.tr(),
          itemData: pet.sex != null ? pet.sex : '',
        ),
        ProfileInfoTile(
          title: '',
          itemData: pet.age != null ? pet.age.toString() : '',
        ),
        ProfileInfoTile(
          title: 'date_of_birth'.tr(),
          itemData: pet.birthdate != null ? DateFormat('dd/MM/yyyy').format(pet.birthdate) : '',
        ),
        ProfileInfoTile(
          title: 'weight'.tr(),
          itemData: pet.weight != null ? pet.weight : '',
        ),
        ProfileInfoTile(
          title: 'hasMicrochip'.tr(),
          boolItemData: pet.weight != null ?? pet.hasMicrochip,
        ),
        ProfileInfoTile(
          title: 'hasBeenVaccinated'.tr(),
          boolItemData: pet.weight != null ?? pet.hasBeenVaccinated,
        ),
        ProfileInfoTile(
          title: 'hasBeenDewormed'.tr(),
          boolItemData: pet.weight != null ?? pet.hasBeenDewormed,
        ),
        ProfileInfoTile(
          title: 'hasBeenSterializedSpayed'.tr(),
          boolItemData: pet.weight != null ?? pet.hasBeenSterilizedSpayed,
        ),
        ProfileInfoTile(
          title: 'isGuideDog'.tr(),
          boolItemData: pet.weight != null ?? pet.isGuideDog,
        ),
        ProfileInfoTile(
          title: 'isLost'.tr(),
          boolItemData: pet.isLost != null ? pet.isLost : pet.isLost,
        ),
      ],
    );
  }
}
