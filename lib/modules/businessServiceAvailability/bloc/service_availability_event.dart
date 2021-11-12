part of 'service_availability_bloc.dart';

@immutable
abstract class ServiceAvailabilityEvent extends Equatable {}

class FetchServiceAvailabilities extends ServiceAvailabilityEvent {
  final String serviceId;
  final String businessTenant;
  final String businessId;
  final String dateToFilterTimeSlot;

  FetchServiceAvailabilities({this.serviceId, this.businessTenant, this.businessId, this.dateToFilterTimeSlot});

  FetchServiceAvailabilities copyWith({
   String serviceId,
   String businessTenant,
   String businessId,
   String dateToFilterTimeSlot
  }) => FetchServiceAvailabilities(
      serviceId: serviceId ?? this.serviceId,
      businessTenant: businessTenant ?? this.businessTenant,
      businessId: businessId ?? this.businessId,
      dateToFilterTimeSlot: dateToFilterTimeSlot ?? this.dateToFilterTimeSlot
  );

  @override
  List<Object> get props => [serviceId, businessTenant, businessId, dateToFilterTimeSlot];
}