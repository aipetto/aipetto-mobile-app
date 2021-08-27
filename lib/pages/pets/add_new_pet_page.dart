import 'package:aipetto/pages/pets/widgets/new_pet_widget.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../components/custom_button.dart';
import '../../utils/constants.dart';

class AddNewPetPage extends StatefulWidget {

  final String petTypeId;
  final String petTypeName;

  const AddNewPetPage({Key key, this.petTypeId, this.petTypeName}) : super(key: key);

  @override
  _AddNewPetPageState createState() => _AddNewPetPageState();
}

class _AddNewPetPageState extends State<AddNewPetPage> {
  bool _editing = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.petTypeId),
        actions: <Widget>[
          IconButton(
            onPressed: () {
              setState(() {
                _editing = !_editing;
              });
            },
            icon: Icon(
              _editing ? Icons.close : Icons.edit,
              color:kAmphibianColorGreenLight,
            ),
          )
        ],
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: SingleChildScrollView(
              child: NewPetWidget(),
            ),
          ),
          if (_editing)
            Container(
              padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
              child: CustomButton(
                onPressed: () {},
                text: 'update_info'.tr(),
              ),
            )
        ],
      ),
    );
  }
}
