import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../model/veterinarian/veterinarian.dart';
import '../utils/constants.dart';
import 'custom_button.dart';

class MyVeterinarianListItem extends StatelessWidget {
  final Veterinarian veterinarian;

  const MyVeterinarianListItem({Key key, @required this.veterinarian}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
        child: Row(
          children: <Widget>[
            Image.asset(
              veterinarian.avatar,
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
                    veterinarian.name,
                    style: Theme.of(context)
                        .textTheme
                        .subtitle2
                        .copyWith(fontWeight: FontWeight.w700),
                  ),
                  Text(
                    veterinarian.speciality + '\n',
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 14,
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
              onPressed: () {},
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
