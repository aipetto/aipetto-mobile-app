import 'dart:io';

import 'package:aipetto/components/custom_button.dart';
import 'package:aipetto/modules/auth/bloc/authentication_bloc.dart';
import 'package:aipetto/modules/pet/bloc/form/pet_form_bloc.dart';
import 'package:aipetto/modules/pet/models/pet.dart';
import 'package:aipetto/routes/routes.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

import '../../../components/text_form_field.dart';
import '../../../utils/constants.dart';

class NewPetWidget extends StatefulWidget {

  final String petTypeId;
  final String petTypeName;

  const NewPetWidget({Key key, @required this.petTypeId, @required this.petTypeName}) : super(key: key);

  @override
  _NewPetWidgetState createState() => _NewPetWidgetState();
}

class _NewPetWidgetState extends State<NewPetWidget> {

  final GlobalKey<FormState> _key   = GlobalKey<FormState>();
  final _name                       = TextEditingController();
  final _nickname                   = TextEditingController();
  ///var _selectedBloodGroup        = 'DEA-1.1';
  var _selectedLookingForMatch      = false;
  var _hasBeenVaccinated            = false;
  var _hasBeenDewormed              = false;
  var _hasBeenSterilizedSpayed      = true;
  var _lookingForMatchAnswers       = <String>['yes'.tr(), 'no'.tr()]; ///var _isLookingForMatch = true;
  var _isGuideDog                   = false;
  var hasMicrochip                  = false;
  /// Dynamic Dropdown consume Breed from API passing language
  var _selectedSex                  = 'male'.tr();
  var _birthDate                    = '03/04/2016';
  var _sexItems                     = <String>['male'.tr(), 'female'.tr()];

  List<DropdownMenuItem<String>> _dropDownSex;

  File _imagePetProfile;

  Future _getImage(ImageSource imageSource) async {
    final picker = new ImagePicker();
    final PickedFile _pickedFile = await picker.getImage(source: imageSource);
    setState(() {
      _imagePetProfile = File.fromUri(Uri(path: _pickedFile.path));
    });

    if( _pickedFile == null ){
      print('No image selected');
      return;
    }
  }

  _initDropDowns() {
    _dropDownSex = _sexItems
        .map((String value) => DropdownMenuItem<String>(
      value: value,
      child: Text(value),
    )).toList();
  }

  @override
  void initState() {
    super.initState();
    _initDropDowns();
  }

  @override
  Widget build(BuildContext context) {

    final _petFormBloc = BlocProvider.of<PetFormBloc>(context);
    final AuthenticationState currentUser = BlocProvider.of<AuthenticationBloc>(context).state;

    _onNewPetFormButtonPressed() {
      if(_key.currentState.validate()) {

        if(currentUser is AuthenticationAuthenticated){
          final superPet = new Pet(
            name: _name.text,
            isLookingForMatch: _selectedLookingForMatch,
            tenant: currentUser.user.tenants.first.tenant.id,
            createdBy: currentUser.user.id,
            updatedBy: currentUser.user.id,
          );

          _petFormBloc.add(NewPetFormButtonPressed(pet: superPet, fileImageProfile: this._imagePetProfile));
        }
      }
    }
    return BlocListener<PetFormBloc, PetFormState>(
        listener: (context, state) {

        if (state is PetFormSuccess) {
          Navigator.of(context).pushNamed(Routes.home);
        }
      },
      child: Padding(
      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 25),
      child: BlocBuilder<PetFormBloc, PetFormState>(
        builder: (context, state){

          if(state is PetFormLoading){
            return Center(
              child: CircularProgressIndicator(),
            );
          }

        return Form(
          key: _key,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Center(
                child: GestureDetector(
                  onTap: () {
                    _openBottomSheet(context);
                  },
                  child: _imagePetProfile == null
                      ? CircleAvatar(
                    radius: 100,
                    backgroundColor: Colors.grey,
                    //backgroundImage: NetworkImage(avatarUrl),
                  )
                      : CircleAvatar(
                    radius: 100,
                    backgroundImage: FileImage(_imagePetProfile),
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
                controller: _name,
                hintText: 'Hachikō',
                validator: (value) =>
                value.isEmpty ? 'Please add a name' : null,
              ),
              /**SizedBox(height: 15),
              Text(
                'breed_dot'.tr(),
                style: kInputTextStyle,
              ),
              CustomTextFormField(
                  hintText: 'Akita'
              ),
              SizedBox(height: 15),
              Text(
                'nickname'.tr(),
                style: kInputTextStyle,
              ),
              CustomTextFormField(
                  hintText: 'Akita'
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
              ),*/

              SizedBox(height: 15),
              Text(
                'looking_for_match'.tr(),
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
              /**Text(
                'weight_dot'.tr(),
                style: kInputTextStyle,
              ),
              CustomTextFormField(
                keyboardType: TextInputType.number,
                hintText: 'in_kg'.tr(),
              ),**/
              Container(
                padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                child:   CustomButton(
                  onPressed: state is PetFormLoading ? () {} : _onNewPetFormButtonPressed,
                  text: 'add_new_pet'.tr(),
                ),
              )
            ],
          ),
        );
       }
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
