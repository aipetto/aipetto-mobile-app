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
      height: 160,
      margin: EdgeInsets.symmetric(vertical: 10),
      padding: EdgeInsets.all(5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: Color(0xff7b7b7b),
        boxShadow: [
          BoxShadow(
              color: Color(0xffc1c1c1),
              offset: Offset(0, 1),
              blurRadius: 1,
              spreadRadius: 0),
          BoxShadow(
              color: Color(0xffc1c1c1),
              offset: Offset(0, -1),
              blurRadius: 1,
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
                  radius: 40,
                  backgroundColor: Colors.grey,
                  backgroundImage: AssetImage(business.avatar),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  width: 250,
                  child: Center(
                    child: Text(
                      business.name,
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
