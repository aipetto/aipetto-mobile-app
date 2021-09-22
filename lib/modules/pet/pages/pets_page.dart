import 'package:aipetto/modules/pet/models/pets.dart';
import 'package:aipetto/modules/pet/widgets/pets_page_list_item.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class MyPetsListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'my_pets'.tr(),
        ),
      ),
      body: ListView.separated(
        separatorBuilder: (context, index) => SizedBox(
          height: 15,
        ),
        itemCount: 5,
        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 25),
        itemBuilder: (context, index) {
          return MyPetListItem(
            pet: pets[index],
          );
        },
      ),
    );
  }
}
