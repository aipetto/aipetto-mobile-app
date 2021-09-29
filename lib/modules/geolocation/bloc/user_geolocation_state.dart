part of 'user_geolocation_bloc.dart';

@immutable
class UserGeolocationState {
  final bool tracking;
  final bool existLocation;
  final LatLng geoLocation;

  UserGeolocationState(
      {this.tracking = true, this.existLocation = false, this.geoLocation});

  UserGeolocationState copyWith({
    bool tracking,
    bool existLocation,
    LatLng geoLocation,
  }) =>
      new UserGeolocationState(
          tracking: tracking ?? this.tracking,
          existLocation: existLocation ?? this.existLocation,
          geoLocation: geoLocation ?? this.geoLocation);
}
