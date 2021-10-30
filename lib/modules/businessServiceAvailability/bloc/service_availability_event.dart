part of 'service_availability_bloc.dart';

@immutable
abstract class ServiceAvailabilityEvent extends Equatable {}

class FetchServiceAvailabilities extends ServiceAvailabilityEvent {
  final String serviceId;
  final String businessTenant;
  final String businessId;

  FetchServiceAvailabilities(this.serviceId, this.businessTenant, this.businessId);

  @override
  List<Object> get props => [serviceId, businessTenant, businessId];
}