import 'dart:async';

import 'package:aipetto/modules/businessPlace/models/business_place.dart';
import 'package:aipetto/modules/businessPlace/repository/business_place_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

part 'business_place_event.dart';
part 'business_place_state.dart';

class BusinessPlaceBloc extends Bloc<BusinessPlaceEvent, BusinessPlaceState> {
  final BusinessPlaceRespository businessPlaceRepository;

  BusinessPlaceBloc({@required this.businessPlaceRepository})
      : assert(businessPlaceRepository != null), super(BusinessPlaceEmpty());

  @override
  BusinessPlaceState get initialState => BusinessPlaceEmpty();

  @override
  Stream<BusinessPlaceState> mapEventToState(BusinessPlaceEvent event) async* {

    if (event is BusinessPlacesNearby) {
      yield BusinessPlaceLoading();
      try {
        final List<BusinessPlace> businessPlaces =
            await businessPlaceRepository.fetchBusinessPlacesNearby('latExampleTemp,lnglatExampleTemp', 'serviceIdExampleTemp');
        yield NearbyBusinessPlaceLoaded(businessPlaces);
      } catch (_) {
        yield BusinessPlaceError();
      }
    }

    if (event is BusinessPlaceDetail) {
      yield BusinessPlaceLoading();
      try {
        final BusinessPlace businessPlace = await businessPlaceRepository.fetchBusinessDetail(event.businessTenant, event.placeId);
        yield BusinessPlaceLoaded(businessPlace);
      } catch (_) {
        yield BusinessPlaceError();
      }
    }
  }
}
