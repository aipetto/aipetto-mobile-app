import 'package:aipetto/model/business.dart';
import 'package:flutter/material.dart';

import '../model/veterinarian.dart';

class BusinessPlaceItem extends StatelessWidget {
  final Business business;

  const BusinessPlaceItem({Key key, @required this.business}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      child: Row(
        children: <Widget>[
          CircleAvatar(
            radius: 20,
            backgroundColor: Colors.transparent,
            child: Image.asset(
              business.avatar,
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
                  business.name,
                  style: Theme.of(context)
                      .textTheme
                      .subtitle2
                      .copyWith(fontWeight: FontWeight.w700),
                ),
                SizedBox(
                  height: 3,
                ),
                Text(
                  business.speciality,
                  style: TextStyle(
                    color: Colors.grey[350],
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
