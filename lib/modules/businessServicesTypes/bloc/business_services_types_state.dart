part of 'business_services_types_bloc.dart';

abstract class BusinessServicesTypesState extends Equatable{

  BusinessServicesTypesState();

  @override
  List<Object> get props => [];
}

class BusinessServicesTypesEmpty extends BusinessServicesTypesState{}

class BusinessServicesTypesLoading extends BusinessServicesTypesState{}

class BusinessServicesTypesLoaded extends BusinessServicesTypesState{
  final BusinessServiceType businessServiceType;

  BusinessServicesTypesLoaded({@required this.businessServiceType}) : assert(businessServiceType != null);

  @override
  List<Object> get props => [businessServiceType];
}

class BusinessServicesTypesError extends BusinessServicesTypesState{}