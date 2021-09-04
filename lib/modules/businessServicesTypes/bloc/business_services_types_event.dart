part of 'business_services_types_bloc.dart';

@immutable
abstract class BusinessServicesTypesEvent extends Equatable{}

class FetchBusinessServicesTypes extends BusinessServicesTypesEvent{

  FetchBusinessServicesTypes();

  @override
  List<Object> get props => [];
}