import 'package:aipetto/modules/auth/widgets/cta_authentication_widget.dart';
import 'package:aipetto/modules/pet/bloc/pet_bloc.dart';
import 'package:aipetto/modules/pet/models/pets.dart';
import 'package:aipetto/modules/pet/widgets/pets_of_owner_list_item.dart';
import 'package:aipetto/utils/constants.dart';
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
        if (state is PetLoading) {
          return Flexible(child: Center(child: CircularProgressIndicator()));
        } else if (state is PetError) {
          return CtaAuthenticationWidget();
        } else if (state is PetEmpty) {
          return Center(
              child: GestureDetector(
                  onTap: () {
                    FocusScope.of(context).requestFocus(FocusNode());
                    Navigator.of(context).pushNamed(Routes.choosePetType);
                  },
                  child: Column(children: <Widget>[
                    CircleAvatar(
                      radius: 40,
                      backgroundColor: Colors.grey,
                      backgroundImage:
                          AssetImage('assets/images/pets/pet_1.jpg'),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Text(
                      'add_your_pet'.tr(),
                      style: Theme.of(context)
                          .textTheme
                          .subtitle2
                          .copyWith(fontSize: 18),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    )
                  ])));
        } else {
          final stateAsPetsLoadedState = state as PetsLoaded;
          final pets = stateAsPetsLoadedState.pets;
          return buildPetsHorizontalList(pets);
        }
      },
      listener: (context, state) {
        if (state is PetLoaded) {
          final stateAsPetsLoadedState = state as PetsLoaded;
          final pets = stateAsPetsLoadedState.pets;
          return buildPetsHorizontalList(pets);
        }
      },
    );
  }

  Widget buildPetsHorizontalList(List<Pet> pets) {
    return Container(
      height: 130,
      child: ListView.separated(
        separatorBuilder: (context, index) => SizedBox(
          width: 15,
        ),
        itemCount: pets.length + 1,
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.symmetric(horizontal: 20),
        itemBuilder: (context, index) {
          if (index == 0) {
            return GestureDetector(
                onTap: () {
                  FocusScope.of(context).requestFocus(FocusNode());
                  Navigator.of(context).pushNamed(Routes.choosePetType);
                },
                child: Column(children: <Widget>[
                  Container(
                    margin: EdgeInsets.all(10),
                    padding: EdgeInsets.all(20),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        border: Border.all(
                            width: 2,
                            color: kAmphibianColorBlueDarkAlternative)),
                    child: Icon(
                      Icons.add,
                      color: kAmphibianColorGreenLight,
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Text(
                    'add_your_pet'.tr(),
                    style: Theme.of(context)
                        .textTheme
                        .subtitle2
                        .copyWith(fontSize: 18),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  )
                ]));
          } else {
            return PetsOfOwnerListItem(
              pet: pets[--index],
            );
          }
        },
      ),
    );
  }
}
