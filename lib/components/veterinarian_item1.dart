import 'package:flutter/material.dart';

import '../model/veterinarian.dart';

class VeterinarianItem1 extends StatelessWidget {
  final Veterinarian veterinarian;

  const VeterinarianItem1({Key key, @required this.veterinarian}) : super(key: key);
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
              veterinarian.avatar,
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
                  veterinarian.name,
                  style: Theme.of(context)
                      .textTheme
                      .subtitle2
                      .copyWith(fontWeight: FontWeight.w700),
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
              ],
            ),
          )
        ],
      ),
    );
  }
}
