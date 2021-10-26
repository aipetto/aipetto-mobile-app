import 'package:aipetto/modules/pet/pages/pet_type_list.dart';
import 'package:aipetto/modules/petType/bloc/pet_type_bloc.dart';
import 'package:aipetto/modules/petType/repository/pet_type_repository.dart';
import 'package:aipetto/modules/petType/services/petTypeApiClient.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;

class ChoosePetTypePage extends StatelessWidget {
  final PetTypeRepository petTypeRepository = PetTypeRepository(
      petTypeClient: PetTypeApiClient(
    httpClient: http.Client(),
  ));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider<PetTypeBloc>(
        create: (_) => PetTypeBloc(petTypeRepository: petTypeRepository)
          ..add(FetchPetType()),
        child: PetTypeList(),
      ),
    );
  }
}
