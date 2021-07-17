import 'package:flutter/material.dart';

import '../model/veterinarian.dart';

class VisitedDoctorListItem extends StatelessWidget {
  final Veterinarian doctor;

  const VisitedDoctorListItem({Key key, @required this.doctor})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          CircleAvatar(
            radius: 30,
            backgroundColor: Colors.grey,
            backgroundImage: AssetImage(doctor.avatar),
          ),
          SizedBox(
            height: 15,
          ),
          Text(
            doctor.name,
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
