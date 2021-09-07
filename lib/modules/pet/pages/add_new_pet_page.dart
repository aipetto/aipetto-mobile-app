import 'package:aipetto/modules/pet/widgets/new_pet_widget.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class AddNewPetPage extends StatefulWidget {

  final String petTypeId;
  final String petTypeName;

  const AddNewPetPage({Key key, this.petTypeId, this.petTypeName}) : super(key: key);

  @override
  _AddNewPetPageState createState() => _AddNewPetPageState();
}

class _AddNewPetPageState extends State<AddNewPetPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('add_new_pet'.tr()),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: SingleChildScrollView(
              child: NewPetWidget(
                  petTypeId: widget.petTypeId,
                  petTypeName: widget.petTypeName
              ),
            ),
          ),
        ],
      ),
    );
  }
}
