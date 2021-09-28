import 'package:aipetto/modules/petType/models/pet_type.dart' as PetTypeModel;
import 'package:flutter/material.dart';

class PetTypeItem extends StatelessWidget {
  final PetTypeModel.Row petType;
  final Function onTap;

  const PetTypeItem(
      {Key key, @required this.petType, @required this.onTap})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(4),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
          child: Row(
            children: <Widget>[
             petType.image.isEmpty ? CircleAvatar(
               backgroundColor: Colors.grey[300],
               radius: 25,
             ) : CircleAvatar(
                backgroundColor: Colors.grey[300],
                backgroundImage: NetworkImage(petType.image.first.downloadUrl),
                radius: 25,
              ),
              SizedBox(
                width: 10,
              ),
              Expanded(
                child: Text(
                  petType.name + '\n',
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
