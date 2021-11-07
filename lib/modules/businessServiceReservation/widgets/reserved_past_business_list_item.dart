import 'package:aipetto/modules/businessPlace/models/business_place.dart';
import 'package:aipetto/routes/routes.dart';
import 'package:aipetto/utils/constants.dart';
import 'package:flutter/material.dart';

class ReservedPastBusinessListItem extends StatelessWidget {
  final BusinessPlace businessPlace;

  const ReservedPastBusinessListItem({Key key, @required this.businessPlace})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 180,
      margin: EdgeInsets.symmetric(vertical: 10),
      padding: EdgeInsets.all(5),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: kAmphibianColorBlueLight),
      child: GestureDetector(
        onTap: () {
          Navigator.of(context).pushNamed(Routes.bookingStep2DetailsOfPlace, arguments: new BusinessPlaceSelected(staticBusinessesPlaces.first));
        },
        child: Column(
          children: <Widget>[
            CircleAvatar(
              radius: 50,
              backgroundColor: Colors.grey,
              backgroundImage: AssetImage(businessPlace.photoLogo.first['privateUrl']),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              width: 250,
              child: Center(
                child: Text(
                  businessPlace.name,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.clip,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
