part of 'business_place_bloc.dart';

abstract class BusinessPlaceState extends Equatable {
  BusinessPlaceState();

  @override
  List<Object> get props => [];
}

class BusinessPlaceEmpty extends BusinessPlaceState {}

class BusinessPlaceLoading extends BusinessPlaceState {}

class NearbyBusinessPlaceLoaded extends BusinessPlaceState {
  final List<BusinessPlace> businessesPlaces;

  NearbyBusinessPlaceLoaded(this.businessesPlaces) : assert(businessesPlaces != null);

  @override
  List<Object> get props => [businessesPlaces];
}

class BusinessPlaceLoaded extends BusinessPlaceState {
  final BusinessPlace businessPlace;

  BusinessPlaceLoaded(this.businessPlace) : assert(businessPlace != null);

  @override
  List<Object> get props => [businessPlace];
}

class PetError extends BusinessPlaceState {}
