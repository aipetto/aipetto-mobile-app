import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../routes/routes.dart';
import '../../utils/constants.dart';

class DrawerPage extends StatelessWidget {
  final Function onTap;

  const DrawerPage({Key key, @required this.onTap}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/images/background_bones_pawn.jpg"),
                colorFilter: new ColorFilter.mode(Colors.black.withOpacity(0.3), BlendMode.dstATop),
                fit: BoxFit.cover)
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(
              vertical: 35,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      CircleAvatar(
                        radius: 50,
                        backgroundColor: Colors.grey,
                        backgroundImage: AssetImage(
                          'assets/images/icon_man.png',
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: <Widget>[
                          Text(
                            'Pet Owner name',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                _drawerItem(
                  image: 'person',
                  text: 'my_veterinarians',
                  onTap: () => Navigator.of(context).pushNamed(Routes.myDoctors),
                ),
                _drawerItem(
                  image: 'dog_icon',
                  text: 'my_pets',
                  onTap: () => Navigator.of(context).pushNamed(Routes.myPets),
                ),
                _drawerItem(
                  image: 'calendar',
                  text: 'my_appointments',
                  onTap: () => Navigator.of(context).pushNamed(Routes.myAppointments),
                ),
                _drawerItem(
                  image: 'icon_settings',
                  text: 'settings',
                  onTap: () => Navigator.of(context).pushNamed(Routes.appSettings),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  InkWell _drawerItem({
    @required String image,
    @required String text,
    @required Function onTap,
  }) {
    return InkWell(
      onTap: () {
        onTap();
        //this.onTap();
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        width: double.infinity,
        height: 58,
        child: Row(
          children: <Widget>[
            Image.asset(
              'assets/images/$image.png',
              color: Colors.white,
            ),
            SizedBox(
              width: 10,
            ),
            Text(
              text.tr(),
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            )
          ],
        ),
      ),
    );
  }
}
