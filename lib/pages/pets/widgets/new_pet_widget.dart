import 'dart:io';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../../../components/text_form_field.dart';
import '../../../utils/constants.dart';

class NewPetWidget extends StatefulWidget {
  @override
  _NewPetWidgetState createState() => _NewPetWidgetState();
}

class _NewPetWidgetState extends State<NewPetWidget> {
  var _selectedSex = 'male'.tr();

  var _selectedBloodGroup = 'DEA-1.1';
  var _selectedLookingForMatch = true;
  var _sexItems = <String>['male'.tr(), 'female'.tr()];
  static const _bloodItems = <String>[
    'DEA-1.1',
    'DEA-1.2',
    'DEA-3',
    'DEA-4',
    'DEA-5',
    'DEA-7',
  ];
  var _lookingForMatchAnswers = <String>['yes'.tr(), 'no'.tr()];

  var _birthDate = '03/04/2016';

  List<DropdownMenuItem<String>> _dropDownSex;
  List<DropdownMenuItem<String>> _dropDownMarital;

  List<DropdownMenuItem<String>> _dropDownBlood = _bloodItems
      .map((String value) => DropdownMenuItem<String>(
    value: value,
    child: Text(value),
  ))
      .toList();

  File _image;

  Future _getImage(ImageSource imageSource) async {
    var image = await ImagePicker.pickImage(source: imageSource);
    setState(() {
      _image = image;
    });
    //uploadPic();
  }

  _initDropDowns() {
    _dropDownSex = _sexItems
        .map((String value) => DropdownMenuItem<String>(
      value: value,
      child: Text(value),
    ))
        .toList();

    _dropDownMarital = _lookingForMatchAnswers
        .map((String value) => DropdownMenuItem<String>(
      value: value,
      child: Text(value),
    ))
        .toList();
  }

  @override
  void initState() {
    super.initState();
    _initDropDowns();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 25),
      child: Form(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Center(
              child: GestureDetector(
                onTap: () {
                  _openBottomSheet(context);
                },
                child: _image == null
                    ? CircleAvatar(
                  radius: 80,
                  backgroundColor: Colors.grey,
                  //backgroundImage: NetworkImage(avatarUrl),
                )
                    : CircleAvatar(
                  radius: 80,
                  backgroundImage: FileImage(_image),
                ),
              ),
            ),
            Center(
              child: FlatButton(
                onPressed: () {
                  _openBottomSheet(context);
                },
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(4)),
                child: Text(
                  'change_avatar'.tr(),
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 25,
            ),
            Text(
              'name_dot'.tr(),
              style: kInputTextStyle,
            ),
            CustomTextFormField(
              hintText: 'Hachikō',
              validator: (value) =>
              value.isEmpty ? 'Please add a name' : null,
            ),
            SizedBox(height: 15),
            Text(
              'breed_dot'.tr(),
              style: kInputTextStyle,
            ),
            CustomTextFormField(
                hintText: 'Akita'
            ),
            SizedBox(height: 15),
            Text(
              'last_name_dot'.tr(),
              style: kInputTextStyle,
            ),
            SizedBox(height: 15),
            Text(
              'sex_dot'.tr(),
              style: kInputTextStyle,
            ),
            DropdownButton(
              isExpanded: true,
              value: _selectedSex,
              //hint: ,
              onChanged: (value) {
                setState(() {
                  _selectedSex = value;
                });
              },
              items: _dropDownSex,
            ),
            SizedBox(height: 15),
            Text(
              'date_of_birth_dot'.tr(),
              style: kInputTextStyle,
            ),
            ListTile(
              contentPadding: EdgeInsets.all(0),
              title: Text(_birthDate),
              onTap: () {
                showDatePicker(
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: DateTime(1900),
                  lastDate: DateTime.now(),
                ).then((DateTime value) {
                  if (value != null) {
                    setState(() {
                      _birthDate = value.toString();
                    });
                  }
                });
              },
            ),
            SizedBox(height: 15),
            Text(
              'blood_group_dot'.tr(),
              style: kInputTextStyle,
            ),
            DropdownButton(
              isExpanded: true,
              value: _selectedBloodGroup,
              //hint: ,
              onChanged: (value) {
                setState(() {
                  _selectedBloodGroup = value;
                });
              },
              items: _dropDownBlood,
            ),
            SizedBox(height: 15),
            Text(
              'available_for_match'.tr(),
              style: kInputTextStyle,
            ),
            SwitchListTile(
              value: _selectedLookingForMatch,
              onChanged: (_) {
                setState(() {
                  _selectedLookingForMatch = !_selectedLookingForMatch;
                });
              },
            ),
            SizedBox(height: 15),
            Text(
              'weight_dot'.tr(),
              style: kInputTextStyle,
            ),
            CustomTextFormField(
              keyboardType: TextInputType.number,
              hintText: 'in_kg'.tr(),
            ),
          ],
        ),
      ),
    );
  }

  _openBottomSheet(BuildContext context) {
    showModalBottomSheet(
        context: context,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(12),
            topRight: Radius.circular(12),
          ),
        ),
        builder: (BuildContext context) {
          return Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              ListTile(
                leading: Icon(
                  Icons.camera,
                  size: 20,
                ),
                title: Text(
                  'take_a_photo'.tr(),
                  style: TextStyle(
                    color: Color(0xff4a4a4a),
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                    fontStyle: FontStyle.normal,
                  ),
                ),
                onTap: () {
                  Navigator.of(context).pop();
                  _getImage(ImageSource.camera);
                },
              ),
              ListTile(
                leading: Icon(
                  Icons.photo_library,
                  size: 20,
                ),
                title: Text(
                  'choose_a_photo'.tr(),
                  style: TextStyle(
                    color: Color(0xff4a4a4a),
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                    fontStyle: FontStyle.normal,
                  ),
                ),
                onTap: () {
                  Navigator.of(context).pop();
                  _getImage(ImageSource.gallery);
                },
              ),
            ],
          );
        });
  }
}
