import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';

import '../../routes/routes.dart';
import '../../utils/constants.dart';

class PetsPage extends StatefulWidget {
  @override
  _PetsPageState createState() => _PetsPageState();
}

class _PetsPageState extends State<PetsPage>
    with AutomaticKeepAliveClientMixin<PetsPage> {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          MessageListItem(
            onTap: () {
              Navigator.of(context).pushNamed(Routes.petProfile);
            },
            imagePath: 'assets/images/pets/pet_1.jpg',
            name: 'Super dog'
          ),
          MessageListItem(
            onTap: () {
              Navigator.of(context).pushNamed(Routes.petProfile);
            },
            imagePath: 'assets/images/pets/cat_1.jpg',
            name: 'My cat'
          ),
          MessageListItem(
            onTap: () {
              Navigator.of(context).pushNamed(Routes.petProfile);
            },
            imagePath: 'assets/images/pets/pet_2.jpg',
            name: 'Little puppy'
          ),
        ],
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}

class MessageListItem extends StatelessWidget {
  final Function onTap;
  final String imagePath;
  final String name;

  const MessageListItem(
      {Key key,
        @required this.onTap,
        @required this.imagePath,
        @required this.name})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: EdgeInsets.all(10),
        child: Row(
          children: <Widget>[
            Container(
              width: 50,
              height: 50,
              child: Stack(
                children: <Widget>[
                  CircleAvatar(
                    radius: 25,
                    backgroundColor: Colors.transparent,
                    child: Image.asset(
                      imagePath,
                      fit: BoxFit.fill,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              width: 10,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    name,
                    style: Theme.of(context).textTheme.subtitle2.copyWith(
                      fontWeight: FontWeight.w700,
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              width: 5,
            ),
          ],
        ),
      ),
    );
  }
}
