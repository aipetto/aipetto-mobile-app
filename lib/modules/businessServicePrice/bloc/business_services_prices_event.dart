part of 'business_services_prices_bloc.dart';

@immutable
abstract class BusinessServicesPricesEvent extends Equatable {}

class FetchBusinessServicesPrices extends BusinessServicesPricesEvent {

  final String? businessTenant;

  FetchBusinessServicesPrices({required this.businessTenant});

  @override
  List<Object> get props => [];
}
