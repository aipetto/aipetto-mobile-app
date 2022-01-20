import 'package:aipetto/config/environment.dart';
import 'package:aipetto/modules/businessPlace/models/business_place.dart';
import 'package:flutter/material.dart';

class BusinessPlaceItem extends StatelessWidget {
  final BusinessPlace businessPlace;

  final void Function()? onTap;

  const BusinessPlaceItem(
      {this.onTap, required this.businessPlace});
  @override
  Widget build(BuildContext context) {

    final String businessCity = businessPlace.addressCity ?? '';
    final String addressState = businessPlace.addressState ?? '';
    final String addressCountry = businessPlace.addressCountry?.name ?? '';

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
              child: businessPlace.photoLogo?.first['privateUrl'].startsWith('assets') ?
              Image.asset(
                businessPlace.photoLogo?.first['privateUrl'],
                height: 500,
                width: MediaQuery.of(context).size.width,
                fit: BoxFit.cover,
              ) :
              Image.network(
                Environment.aipettoCloudStorageHost + businessPlace.photoLogo?.first['privateUrl'],
                height: 500,
                width: MediaQuery.of(context).size.width,
                fit: BoxFit.cover,
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
                        ?.copyWith(fontSize: 15, fontWeight: FontWeight.w700),
                  ),
                  SizedBox(
                    height: 3,
                  ),
                  Text(
                    businessCompleteAddress ?? '',
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
