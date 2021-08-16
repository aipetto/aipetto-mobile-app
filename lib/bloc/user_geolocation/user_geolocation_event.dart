part of 'user_geolocation_bloc.dart';

@immutable
abstract class UserGeolocationEvent {}

class OnGeolocationChange extends UserGeolocationEvent{
  final LatLng location;
  OnGeolocationChange(this.location);
}