import 'package:aipetto/modules/pet/models/pets.dart';
import 'package:aipetto/routes/routes.dart';
import 'package:flutter/material.dart';

class PetsOfOwnerListItem extends StatelessWidget {
  final Pet pet;

  const PetsOfOwnerListItem({required this.pet});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: GestureDetector(
        onTap: () {
          FocusScope.of(context).requestFocus(FocusNode());
            Navigator.of(context)
              .pushNamed(Routes.petProfile, arguments: PetSelected(this.pet));
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
