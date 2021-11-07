import 'dart:async';

import 'package:aipetto/modules/auth/services/auth_service.dart';
import 'package:aipetto/modules/businessPlace/models/business_place.dart';
import 'package:aipetto/modules/businessPlace/repository/business_place_repository.dart';
import 'package:aipetto/modules/user/models/user.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

part 'business_place_event.dart';
part 'business_place_state.dart';

class BusinessPlaceBloc extends Bloc<BusinessPlaceEvent, BusinessPlaceState> {
  final BusinessPlaceRespository businessPlaceRepository;
  final AuthenticationService authenticationService;

  BusinessPlaceBloc({@required this.authenticationService, @required this.businessPlaceRepository})
      : assert(businessPlaceRepository != null), super(BusinessPlaceEmpty());

  @override
  BusinessPlaceState get initialState => BusinessPlaceEmpty();

  @override
  Stream<BusinessPlaceState> mapEventToState(BusinessPlaceEvent event) async* {

    if (event is BusinessPlacesNearby) {
      yield BusinessPlaceLoading();
      try {
        final User currentUser = await authenticationService.getCurrentUser();
        final List<BusinessPlace> businessPlaces =
            await businessPlaceRepository.fetchBusinessPlacesNearby('lat1231,lng321321', currentUser.tenants.first.tenant.id, 'serviceId11');
        yield NearbyBusinessPlaceLoaded(businessPlaces);
      } catch (_) {
        yield PetError();
      }
    }

    if (event is BusinessPlaceDetail) {
      yield BusinessPlaceLoading();
      try {
        final User currentUser = await authenticationService.getCurrentUser();
        final BusinessPlace businessPlace = await businessPlaceRepository.fetchBusinessDetail(currentUser.tenants.first.tenant.id, event.placeId);
        yield BusinessPlaceLoaded(businessPlace);
      } catch (_) {
        yield PetError();
      }
    }
  }
}
