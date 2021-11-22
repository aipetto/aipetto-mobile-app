part of 'business_services_prices_bloc.dart';

abstract class BusinessServicesPricesState extends Equatable {
  BusinessServicesPricesState();

  @override
  List<Object> get props => [];
}

class BusinessServicesPricesEmpty extends BusinessServicesPricesState {}

class BusinessServicesPricesLoading extends BusinessServicesPricesState {}

class BusinessServicesPricesLoaded extends BusinessServicesPricesState {
  final List<BusinessServicePrice> businessServicePrice;

  BusinessServicesPricesLoaded({@required this.businessServicePrice})
      : assert(businessServicePrice != null);

  @override
  List<Object> get props => [businessServicePrice];
}

class BusinessServicesPricesError extends BusinessServicesPricesState {}