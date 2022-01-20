import 'package:aipetto/components/custom_button.dart';
import 'package:aipetto/modules/pet/models/pets.dart';
import 'package:aipetto/routes/routes.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class MyPetListItem extends StatelessWidget {
  final Pet pet;

  const MyPetListItem({required this.pet});
  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.transparent,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
        child: Row(
          children: <Widget>[
            CircleAvatar(
              radius: 40,
              backgroundColor: Colors.grey,
              backgroundImage: (pet.profileImage.length > 0 &&
                      pet.profileImage[0] != null &&
                      pet.profileImage[0].publicUrl != null)
                  ? NetworkImage(pet.profileImage[0].publicUrl) as ImageProvider
                  : AssetImage('assets/images/aipetto/pets.png'),
            ),
            SizedBox(
              width: 20,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    pet.name,
                    style: Theme.of(context)
                        .textTheme
                        .subtitle2
                        ?.copyWith(fontWeight: FontWeight.w700),
                  ),
                  pet.nickname != null
                      ? Text(
                          pet.nickname + '\n',
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                          ),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        )
                      : Text('')
                ],
              ),
            ),
            SizedBox(
              width: 10,
            ),
            CustomButton(
              text: 'details'.tr(),
              textSize: 14,
              onPressed: () {
                Navigator.of(context).pushNamed(Routes.petProfile,
                    arguments: PetSelected(this.pet));
              },
              padding: EdgeInsets.symmetric(
                vertical: 10,
                horizontal: 5,
              ),
            )
          ],
        ),
      ),
    );
  }
}
