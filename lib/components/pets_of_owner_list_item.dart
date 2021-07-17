import 'package:aipetto/model/pet.dart';
import 'package:flutter/material.dart';

class PetsOfOwnerListItem extends StatelessWidget {
  final Pet pet;

  const PetsOfOwnerListItem({Key key, @required this.pet})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          CircleAvatar(
            radius: 30,
            backgroundColor: Colors.grey,
            backgroundImage: AssetImage(pet.profileImage),
          ),
          SizedBox(
            height: 15,
          ),
          Text(
            pet.name,
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
