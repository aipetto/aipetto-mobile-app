import 'package:aipetto/model/pet.dart';
import 'package:aipetto/routes/routes.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'custom_button.dart';

class MyPetListItem extends StatelessWidget {
  final Pet pet;

  const MyPetListItem({Key key, @required this.pet}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
        child: Row(
          children: <Widget>[
            Image.asset(
              pet.profileImage,
              width: 60,
              height: 60,
            ),
            SizedBox(
              width: 20,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    pet.nickname,
                    style: Theme.of(context)
                        .textTheme
                        .subtitle2
                        .copyWith(fontWeight: FontWeight.w700),
                  ),
                  Text(
                    pet.nickname + '\n',
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
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
                Navigator.of(context).pushNamed(Routes.petProfile);
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
