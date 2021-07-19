import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';

import '../utils/constants.dart';
import '../model/veterinarian.dart';

class VeterinarianItem extends StatelessWidget {
  final Veterinarian veterinarian;
  final Function onTap;

  const VeterinarianItem({Key key, @required this.onTap, @required this.veterinarian})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(20),
        child: Row(
          children: <Widget>[
            CircleAvatar(
              radius: 30,
              backgroundColor: Colors.transparent,
              child: Image.asset(
                veterinarian.avatar,
                fit: BoxFit.fill,
              ),
            ),
            SizedBox(
              width: 20,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Expanded(
                        child: Text(
                          veterinarian.name,
                          style: Theme.of(context)
                              .textTheme
                              .subtitle2
                              .copyWith(fontWeight: FontWeight.w700),
                        ),
                      ),
                      Icon(
                        Icons.star,
                        color:kAmphibianColorGreenLight,
                        size: 18,
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        '${veterinarian.rating}',
                        style: Theme.of(context).textTheme.bodyText2.copyWith(
                              fontSize: 14,
                              fontWeight: FontWeight.w300,
                            ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 3,
                  ),
                  Text(
                    veterinarian.speciality,
                    style: TextStyle(
                      color: Colors.grey[350],
                      fontSize: 14,
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    '${'start_from'.tr()} \$${veterinarian.price}',
                    style: Theme.of(context).textTheme.subtitle2.copyWith(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
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
