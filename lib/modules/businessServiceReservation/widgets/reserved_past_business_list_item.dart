import 'package:aipetto/modules/business/models/business.dart';
import 'package:aipetto/routes/routes.dart';
import 'package:flutter/material.dart';

class ReservedPastBussinessListItem extends StatelessWidget {
  final Business business;

  const ReservedPastBussinessListItem({Key key, @required this.business})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 140,
      margin: EdgeInsets.symmetric(vertical: 10),
      padding: EdgeInsets.all(5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
              color: Color(0x0c000000),
              offset: Offset(0, 5),
              blurRadius: 5,
              spreadRadius: 0),
          BoxShadow(
              color: Color(0x0c000000),
              offset: Offset(0, -5),
              blurRadius: 5,
              spreadRadius: 0),
        ],
      ),

      child: GestureDetector(
              onTap: () {
                Navigator.of(context).pushNamed(Routes.businessProfile); /// TODO Add business_page + place_id -> there we bring information about the business_id or vice-versa
              },
            child: Column(
              children: <Widget>[
                CircleAvatar(
                  radius: 30,
                  backgroundColor: Colors.grey,
                  backgroundImage: AssetImage(business.avatar),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  business.name,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.clip,
                ),
              ],
            ),
      ),
    );
  }
}
