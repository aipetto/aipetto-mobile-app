import 'package:aipetto/components/custom_button.dart';
import 'package:aipetto/modules/pet/models/pets.dart';
import 'package:aipetto/modules/pet/widgets/edit_widget.dart';
import 'package:aipetto/modules/pet/widgets/info_widget.dart';
import 'package:aipetto/utils/constants.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class EditPetProfilePage extends StatefulWidget {

  final Pet pet;

  const EditPetProfilePage({Key key, this.pet}) : super(key: key);

  @override
  _EditPetProfilePageState createState() => _EditPetProfilePageState();
}

class _EditPetProfilePageState extends State<EditPetProfilePage> {
  bool _editing = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('edit_profile'.tr(),
            style: Theme.of(context)
                .textTheme
                .subtitle1
                .copyWith(fontWeight: FontWeight.w700, color: Colors.white)),
        actions: <Widget>[
          IconButton(
            onPressed: () {
              setState(() {
                _editing = !_editing;
              });
            },
            icon: Icon(
              _editing ? Icons.close : Icons.edit,
              color: kAmphibianColorGreenLight,
            ),
          )
        ],
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: SingleChildScrollView(
              child: _editing ? EditWidget(pet: widget.pet) : InfoWidget(pet: widget.pet),
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
