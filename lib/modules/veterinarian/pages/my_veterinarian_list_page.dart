import 'package:aipetto/modules/veterinarian/widgets/my_veterinarian_list_item.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import '../models/veterinarian.dart' as vets;

class MyVeterinarianListPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'my_veterinarian_list'.tr(),
        ),
      ),
      body: ListView.separated(
        separatorBuilder: (context, index) => SizedBox(
          height: 15,
        ),
        itemCount: 4,
        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 25),
        itemBuilder: (context, index) {
          return MyVeterinarianListItem(
            veterinarian: vets.veterinarians[index],
          );
        },
      ),
    );
  }
}
