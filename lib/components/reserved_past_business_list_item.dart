import 'package:flutter/material.dart';

import '../model/business.dart';

class ReservedPastBussinessListItem extends StatelessWidget {
  final Business business;

  const ReservedPastBussinessListItem({Key key, @required this.business})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          CircleAvatar(
            radius: 30,
            backgroundColor: Colors.grey,
            backgroundImage: AssetImage(business.avatar),
          ),
          SizedBox(
            height: 15,
          ),
          Text(
            business.name,
            style: TextStyle(
              color: Colors.black,
              fontSize: 14,
              fontWeight: FontWeight.w400,
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}
