import 'package:aipetto/components/custom_button.dart';
import 'package:aipetto/modules/businessPlace/models/business_place.dart';
import 'package:aipetto/routes/routes.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class MyBusinessListItem extends StatelessWidget {
  final BusinessPlace businessPlace;

  const MyBusinessListItem({required this.businessPlace});
  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.transparent,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
        child: Row(
          children: <Widget>[
            Image.asset(
              businessPlace.photoLogo?.first,
              width: 80,
              height: 80,
            ),
            SizedBox(
              width: 20,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    businessPlace.name,
                    style: Theme.of(context)
                        .textTheme
                        .subtitle2
                        ?.copyWith(fontWeight: FontWeight.w700),
                  ),
                  Text(
                    businessPlace.services?.first + '\n',
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
              onPressed: () {
                Navigator.of(context).pushNamed(Routes.bookingStep2DetailsOfPlace,
                    arguments: BusinessPlaceSelected(businessPlace));
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
