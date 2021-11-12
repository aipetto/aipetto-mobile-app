part of 'service_availability_bloc.dart';

@immutable
abstract class ServiceAvailabilityEvent extends Equatable {}

class FetchServiceAvailabilities extends ServiceAvailabilityEvent {
  final String serviceId;
  final String businessTenant;
  final String businessId;
  final String dateToFilterTimeSlot;

  FetchServiceAvailabilities(this.serviceId, this.businessTenant, this.businessId, this.dateToFilterTimeSlot);

  @override
  List<Object> get props => [serviceId, businessTenant, businessId, dateToFilterTimeSlot];
}