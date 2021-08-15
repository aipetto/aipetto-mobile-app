import 'package:aipetto/routes/routes.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

class AccessGPSPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _AccessGPSPageState();
}

class _AccessGPSPageState extends State<AccessGPSPage> {

  @override
  Widget build(BuildContext context) {
    final String walkImg = 'assets/images/illustrations/pet-searching.png';

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'categories_title'.tr(),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            Container(
              child: Stack(
                alignment: Alignment.center,
                children: <Widget>[
                  walkImg != null ? Image.asset(walkImg, fit: BoxFit.fill) : Container(),
                ],
              ),
            ),

            Text(
              'Enable location to suggest places near you.',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),

            SizedBox(
              height: 25,
            ),

            CupertinoButton(
              child: Text('Usar GPS', style: TextStyle(color: Colors.white )),
              color: Colors.black,
              onPressed: () async {
                final status = await Permission.location.request();
                this.accessGPS(status);
              },
            ),

            SizedBox(
              height: 25,
            ),

            Text(
              'Or',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),

            SizedBox(
              height: 25,
            ),

            CupertinoButton(
              child: Text('Buscar Endereço', style: TextStyle(color: Colors.white )),
              color: Colors.black,
              onPressed: () {
                Navigator.of(context).pushNamed(Routes.addressSearch);
              },
            ),
          ],
        ),
      ),
    );
  }

  void accessGPS(PermissionStatus status) {
    switch( status) {
      case PermissionStatus.granted:
        Navigator.of(context).pushNamed(Routes.bookingStep1FindPlacesNearby);
        break;
      case PermissionStatus.denied:
      case PermissionStatus.undetermined:
      case PermissionStatus.restricted:
      case PermissionStatus.limited:
      case PermissionStatus.permanentlyDenied:
        //Navigator.pushReplacementNamed(context, 'access_gps');
        Navigator.of(context).pushNamed(Routes.categories);
        //openAppSettings();
    }
  }
}
