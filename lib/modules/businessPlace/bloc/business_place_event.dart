part of 'business_place_bloc.dart';

@immutable
abstract class BusinessPlaceEvent extends Equatable {}

class BusinessPlacesNearby extends BusinessPlaceEvent {
  BusinessPlacesNearby();

  @override
  List<Object> get props => [];
}

class BusinessPlaceDetail extends BusinessPlaceEvent {

  String placeId;

  BusinessPlaceDetail(String this.placeId);

  @override
  List<Object> get props => [placeId];
}