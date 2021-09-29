import 'package:aipetto/routes/routes.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

class AccessGPSPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _AccessGPSPageState();
}

class _AccessGPSPageState extends State<AccessGPSPage> with WidgetsBindingObserver{

  @override
  void initState(){
    WidgetsBinding.instance.addObserver(this);
    super.initState();
  }

  @override
  void dispose(){
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) async{
    if( state == AppLifecycleState.resumed ) {
      if (await Permission.location.isGranted) {
        Navigator.of(context).pushNamed(Routes.loading);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final String walkImg = 'assets/images/map.png';
    var h = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

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
                  walkImg != null ? Image.asset(walkImg, width: width * 0.3, height: h * 0.2, fit: BoxFit.fill) : Container(),
                ],
              ),
            ),

            Text(
              'Enable location to suggest places near you.',
              style: TextStyle(
                fontSize: 18,
                color: Colors.black,
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
                color: Colors.black,
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
        Navigator.pushReplacementNamed(context, 'booking_step1_find_places_nearby');
        break;
      case PermissionStatus.denied:
        Navigator.of(context).pushNamed(Routes.accessGPS);
        break;
      case PermissionStatus.undetermined:
      case PermissionStatus.restricted:
      case PermissionStatus.limited:
      case PermissionStatus.permanentlyDenied:
        openAppSettings();
    }
  }
}

