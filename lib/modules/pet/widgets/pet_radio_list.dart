import 'package:aipetto/modules/auth/widgets/cta_authentication_widget.dart';
import 'package:aipetto/modules/businessServiceReservation/bloc/cart/booking_cart_bloc.dart';
import 'package:aipetto/modules/pet/bloc/pet_bloc.dart';
import 'package:aipetto/modules/pet/models/pets.dart';
import 'package:aipetto/routes/routes.dart';
import 'package:aipetto/utils/constants.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PetRadioList extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    return BlocConsumer<PetBloc, PetState>(
      builder: (context, state) {
        if (state is PetLoading) {
          return Flexible(child: Center(child: CircularProgressIndicator()));
        } else if (state is PetError) {
          return CtaAuthenticationWidget(urlToRedirect: Routes.home);
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
                          ?.copyWith(fontSize: 18),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    )
                  ])));
        } else {
          final stateAsPetsLoadedState = state as PetsLoaded;
          final pets = stateAsPetsLoadedState.pets;
          return buildPetsRadioList(pets);
        }
      },
      listener: (context, state) {
        if (state is PetLoaded) {
          final stateAsPetsLoadedState = state as PetsLoaded;
          final pets = stateAsPetsLoadedState.pets;
          buildPetsRadioList(pets);
        }
      },
    );
  }

  Widget buildPetsRadioList(List<Pet> pets) {
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
                        ?.copyWith(fontSize: 18),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  )
                ]));
          } else {
            return PetsOfOwnerRadioItem(
              pet: pets[--index],
            );
          }
        },
      ),
    );
  }
}

class PetsOfOwnerRadioItem extends StatelessWidget {
  final Pet pet;

  const PetsOfOwnerRadioItem({required this.pet});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: GestureDetector(
        onTap: () {
          FocusScope.of(context).requestFocus(FocusNode());
          BlocProvider.of<BookingCartBloc>(context)..add(ChangeBookingCartSelectPet(pet: pet));
          showModalBottomSheet(
              context: context,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(12),
                  topRight: Radius.circular(12),
                ),
              ),
              builder: (BuildContext context) {
                return Container(
                    height: 80,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        ListTile(
                          leading: Icon(
                            Icons.pets,
                            size: 30,
                          ),
                          title:  Text(
                            pet.name + ' ' +  'successfully_selected'.tr(),
                            style: TextStyle(
                              color: Color(0xff4a4a4a),
                              fontSize: 20,
                              fontWeight: FontWeight.w500,
                              fontStyle: FontStyle.normal,
                            ),
                          ),
                          onTap: () {
                            Navigator.of(context).pop();},
                        ),
                      ],
                  ),
                );
              });
        },
        child: Column(
          children: <Widget>[
            CircleAvatar(
              radius: 43,
              backgroundColor: Colors.grey,
              backgroundImage: (pet.profileImage != null &&
                  pet.profileImage.length > 0 &&
                  pet.profileImage[0] != null &&
                  pet.profileImage[0].publicUrl != null)
                  ? NetworkImage(pet.profileImage[0].publicUrl) as ImageProvider
                  : AssetImage('assets/images/aipetto/pets.png'),
            ),
            SizedBox(
              height: 15,
            ),
            RichText(
                overflow: TextOverflow.ellipsis,
                text: TextSpan(
                    style: Theme.of(context)
                        .textTheme
                        .subtitle2
                        ?.copyWith(fontSize: 18),
                    text: pet.name)),
          ],
        ),
      ),
    );
  }
}
