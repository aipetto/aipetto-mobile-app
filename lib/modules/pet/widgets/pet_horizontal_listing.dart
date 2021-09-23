import 'package:aipetto/modules/pet/bloc/pet_bloc.dart';
import 'package:aipetto/modules/pet/models/pets.dart';
import 'package:aipetto/modules/pet/widgets/pets_of_owner_list_item.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:aipetto/routes/routes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PetHorizontalList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PetBloc, PetState>(
      builder: (context, state) {
        if(state is PetLoading) {
          return Flexible(child: Center(child: CircularProgressIndicator()));
        }else if (state is PetError){
          return Center(child: Text('error'));
        }else if (state is PetEmpty){
          BlocProvider.of<PetBloc>(context).add(FetchPets());
          return Center(child: GestureDetector(
              onTap: () {
                FocusScope.of(context).requestFocus(FocusNode());
                Navigator.of(context).pushNamed(Routes.choosePetType);
              },
              child:Column(
                  children: <Widget>[
                    CircleAvatar(
                      radius: 30,
                      backgroundColor: Colors.grey,
                      backgroundImage: AssetImage('assets/images/pets/pet_1.jpg'),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Text(
                      'add_your_pet'.tr(),
                      style: Theme.of(context)
                          .textTheme
                          .subtitle2
                          .copyWith(fontSize: 16),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    )
                  ]
              )
          ));
        }else{
          final stateAsPetsLoadedState = state as PetsLoaded;
          final pets = stateAsPetsLoadedState.pets;
          return buildPetsHorizontalList(pets);
        }
      },
      listener: (context, state) {
        if(state is PetLoaded) {
          final stateAsPetsLoadedState = state as PetsLoaded;
          final pets = stateAsPetsLoadedState.pets;
          return buildPetsHorizontalList(pets);
        }
      },
    );
  }

  Widget buildPetsHorizontalList(List<Pet> pets){
    return Container(
      height: 100,
      child: ListView.separated(
        separatorBuilder: (context, index) => SizedBox(
          width: 15,
        ),
        itemCount: pets.length + 1,
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.symmetric(horizontal: 20),
        itemBuilder: (context, index) {
          if(index == 0){
            return GestureDetector(
                onTap: () {
                  FocusScope.of(context).requestFocus(FocusNode());
                  Navigator.of(context).pushNamed(Routes.choosePetType);
                },
                child:Column(
                    children: <Widget>[
                      CircleAvatar(
                        radius: 30,
                        backgroundColor: Colors.grey,
                        backgroundImage: AssetImage('assets/images/pets/pet_1.jpg'),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Text(
                        'add_your_pet'.tr(),
                        style: Theme.of(context)
                            .textTheme
                            .subtitle2
                            .copyWith(fontSize: 14),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      )
                    ]
                )
            );
          }else{
            return PetsOfOwnerListItem(
              pet: pets[--index],
            );
          }
        },
      ),
    );
  }
}