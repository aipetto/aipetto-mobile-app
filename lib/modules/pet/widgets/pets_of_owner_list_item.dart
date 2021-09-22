import 'package:aipetto/modules/pet/models/pets.dart';
import 'package:aipetto/routes/routes.dart';
import 'package:flutter/material.dart';

class PetsOfOwnerListItem extends StatelessWidget {
  final Pet pet;

  const PetsOfOwnerListItem({Key key, @required this.pet})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
        child: GestureDetector(
          onTap: () {
            FocusScope.of(context).requestFocus(FocusNode());
            Navigator.of(context).pushNamed(Routes.petProfile); /// TODO get the pet profile passing the pet.id
          },
          child: Column(
            children: <Widget>[
              CircleAvatar(
                radius: 30,
                backgroundColor: Colors.grey,
                backgroundImage: AssetImage(pet.photos[0].photo[0].publicUrl),
              ),
              SizedBox(
                height: 15,
              ),
              Text(
                pet.name,
                style: Theme.of(context)
                    .textTheme
                    .subtitle2
                    .copyWith(fontSize: 14),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ),
      );
  }
}
