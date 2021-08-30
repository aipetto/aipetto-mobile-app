import 'package:aipetto/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:permission_handler/permission_handler.dart';

class LoadingPage extends StatefulWidget {

  @override
  _LoadingPageState createState() => _LoadingPageState();
}

class _LoadingPageState extends State<LoadingPage> with WidgetsBindingObserver {

  @override
  void initState() {
    WidgetsBinding.instance.addObserver(this);
    super.initState();
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) async{
    if( state == AppLifecycleState.resumed ) {
      if (await Geolocator.isLocationServiceEnabled()) {
        Navigator.of(context).pushNamed(Routes.bookingStep1FindPlacesNearby);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: FutureBuilder(
          future: this.checkGpsAndLocation(context),
          builder: (BuildContext context, AsyncSnapshot snapshot){
            if ( snapshot.hasData ) {
              return Center(child: Text(snapshot.data));
            } else {
              return Center(
                child: CircularProgressIndicator(strokeWidth: 2),
              );
            }
          },
        )
    );
  }

  Future checkGpsAndLocation( BuildContext context ) async{

    final permissionGPS = await Permission.location.isGranted;
    final gpsActive = await Geolocator.isLocationServiceEnabled();

    await Future.delayed(Duration(milliseconds: 500));

    if ( permissionGPS && gpsActive ) {
      Navigator.of(context).pushNamed(Routes.bookingStep1FindPlacesNearby);
      return '';
    } else if (!permissionGPS) {
      Navigator.of(context).pushNamed(Routes.accessGPS);
      return 'Permission Gps required';
    } else {
      return 'Activate GPS';
    }
  }
}