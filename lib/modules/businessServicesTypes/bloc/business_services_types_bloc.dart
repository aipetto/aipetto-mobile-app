import 'dart:async';

import 'package:aipetto/modules/businessServicesTypes/models/business_services_type.dart';
import 'package:aipetto/modules/businessServicesTypes/repository/business_services_types_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

part 'business_services_types_event.dart';
part 'business_services_types_state.dart';

class BusinessServicesTypesBloc
    extends Bloc<BusinessServicesTypesEvent, BusinessServicesTypesState> {
  final BusinessServiceTypesRepository businessServiceTypeRepository;

  BusinessServicesTypesBloc({@required this.businessServiceTypeRepository})
      : assert(businessServiceTypeRepository != null),
        super(null);

  @override
  BusinessServicesTypesState get initialState => BusinessServicesTypesEmpty();

  @override
  Stream<BusinessServicesTypesState> mapEventToState(
      BusinessServicesTypesEvent event) async* {
    if (event is FetchBusinessServicesTypes) {
      yield BusinessServicesTypesLoading();

      try {
        final BusinessServiceType businessServiceType =
            await businessServiceTypeRepository.fetchBusinessServiceTypes();
        yield BusinessServicesTypesLoaded(
            businessServiceType: businessServiceType);
      } catch (_) {
        yield BusinessServicesTypesError();
      }
    }
  }
}
