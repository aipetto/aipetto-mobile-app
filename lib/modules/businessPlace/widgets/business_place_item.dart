import 'package:aipetto/modules/businessPlace/models/business_place.dart';
import 'package:flutter/material.dart';

class BusinessPlaceItem extends StatelessWidget {
  final BusinessPlace businessPlace;
  final Function onTap;

  const BusinessPlaceItem(
      {Key key, @required this.onTap, @required this.businessPlace})
      : super(key: key);
  @override
  Widget build(BuildContext context) {

    final String businessCity = businessPlace.addressCity ?? '';
    final String addressState = businessPlace.addressState ?? '';
    final String addressCountry = businessPlace.addressCountry.name ?? '';

    final String businessCompleteAddress = businessCity
        + ', '
        + addressState
        + ' - '
        + addressCountry;

    return InkWell(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(20),
        child: Row(
          children: <Widget>[
            CircleAvatar(
              radius: 50,
              backgroundColor: Colors.transparent,
              child: Image.asset(
                businessPlace.photoLogo.first,
                fit: BoxFit.fill,
              ),
            ),
            SizedBox(
              width: 15,
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
                        .copyWith(fontSize: 15, fontWeight: FontWeight.w700),
                  ),
                  SizedBox(
                    height: 3,
                  ),
                  Text(
                    businessPlace.services.first,
                    style: TextStyle(
                      color: Colors.grey[500],
                      fontSize: 16,
                    ),
                  ),
                  Text(
                    businessCompleteAddress,
                    style: TextStyle(
                      color: Colors.grey[500],
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
