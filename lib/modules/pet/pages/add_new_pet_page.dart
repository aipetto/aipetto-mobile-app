import 'package:aipetto/modules/pet/bloc/form/pet_form_bloc.dart';
import 'package:aipetto/modules/pet/repository/pet_repository.dart';
import 'package:aipetto/modules/pet/services/petApiClient.dart';
import 'package:aipetto/modules/pet/widgets/new_pet_widget.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;

class AddNewPetPage extends StatefulWidget {
  final String petTypeId;
  final String petTypeName;

  const AddNewPetPage({Key key, this.petTypeId, this.petTypeName})
      : super(key: key);

  @override
  _AddNewPetPageState createState() => _AddNewPetPageState();
}

class _AddNewPetPageState extends State<AddNewPetPage> {
  @override
  Widget build(BuildContext context) {
    final PetRepository petRepository = PetRepository(
        petClient: PetApiClient(
      httpClient: http.Client(),
    ));

    return Scaffold(
      appBar: AppBar(
        title: Text('add_new_pet'.tr(),
            style: Theme.of(context)
                .textTheme
                .subtitle1
                .copyWith(fontWeight: FontWeight.w700, color: Colors.white)),
      ),
      body: BlocProvider(
        create: (_) => PetFormBloc(repository: petRepository),
        child: Column(
          children: <Widget>[
            Expanded(
              child: SingleChildScrollView(
                child: NewPetWidget(
                    petTypeId: widget.petTypeId,
                    petTypeName: widget.petTypeName),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
