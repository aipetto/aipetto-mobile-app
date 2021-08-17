import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:meta/meta.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart' show LatLng;

part 'user_geolocation_event.dart';
part 'user_geolocation_state.dart';

class UserGeolocationBloc extends Bloc<UserGeolocationEvent, UserGeolocationState>{
  UserGeolocationBloc() : super(UserGeolocationState());

  StreamSubscription<Position> _positionSubscription;

  void getCurrentLocation() {
    this._positionSubscription = Geolocator.getPositionStream(
        desiredAccuracy: LocationAccuracy.high,
        distanceFilter: 10).listen((position) {
        final newLocationInLatLngFormat = new LatLng(position.latitude, position.longitude);
        add( OnGeolocationChange(newLocationInLatLngFormat));
    });
  }

  void cancelGeoCurrentLocation(){
    this._positionSubscription?.cancel();
  }

  @override
  Stream<UserGeolocationState> mapEventToState( UserGeolocationEvent event ) async* {
    // print(event); Instance of OnGeolocationChange
    if (event is OnGeolocationChange ){
      yield state.copyWith(
        existLocation: true,
        geoLocation: event.location
      );
    }
  }
}