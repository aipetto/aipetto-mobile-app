import 'dart:async';

import 'package:aipetto/modules/businessServicePrice/models/business_service_prices.dart';
import 'package:aipetto/modules/businessServicePrice/repository/business_services_prices_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

part 'business_services_prices_event.dart';
part 'business_services_prices_state.dart';

class BusinessServicesPricesBloc
    extends Bloc<BusinessServicesPricesEvent, BusinessServicesPricesState> {
  final BusinessServicesPricesRepository businessServicesPricesRepository;

  BusinessServicesPricesBloc({@required this.businessServicesPricesRepository})
      : assert(businessServicesPricesRepository != null),
        super(null);

  @override
  BusinessServicesPricesState get initialState => BusinessServicesPricesEmpty();

  @override
  Stream<BusinessServicesPricesState> mapEventToState(
      BusinessServicesPricesEvent event) async* {
    if (event is FetchBusinessServicesPrices) {
      yield BusinessServicesPricesLoading();

      try {
        final List<BusinessServicePrice> businessServicePrices = await businessServicesPricesRepository.fetchBusinessServicesPrices(event.businessTenant);
        yield BusinessServicesPricesLoaded(businessServicePrice: businessServicePrices);
      } catch (_) {
        yield BusinessServicesPricesError();
      }
    }
  }
}
