import 'package:aipetto/modules/pet/bloc/pet_bloc.dart';
import 'package:aipetto/modules/pet/models/pets.dart';
import 'package:aipetto/modules/pet/widgets/pets_page_list_item.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyPetsListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PetBloc, PetState>(
        builder: (context, state) {
          if (state is PetLoading) {
            return Expanded(child: Center(child: CircularProgressIndicator()));
          } else if (state is PetError) {
            return Center(child: Text('error'));
          } else if (state is PetEmpty) {
            BlocProvider.of<PetBloc>(context).add(FetchPets());
            return Center(child: Text('Empty'));
          } else {
            final stateAsPetsLoadedState = state as PetsLoaded;
            final pets = stateAsPetsLoadedState.pets;
            return buildPetVerticalList(pets);
          }
        },
    );
  }

  Widget buildPetVerticalList(List<Pet> pets){
      return Scaffold(
        appBar: AppBar(
          title: Text(
            'my_pets'.tr(),
          ),
        ),
        body:
        ListView.separated(
          separatorBuilder: (context, index) => SizedBox(
            height: 15,
          ),
          itemCount: pets.length,
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
