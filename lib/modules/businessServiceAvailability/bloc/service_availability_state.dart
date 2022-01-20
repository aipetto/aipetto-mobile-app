part of 'service_availability_bloc.dart';

abstract class ServiceAvailabilityState extends Equatable {
  ServiceAvailabilityState();

  @override
  List<Object> get props => [];
}

class ServiceAvailabilityEmpty extends ServiceAvailabilityState {}

class ServiceAvailabilityLoading extends ServiceAvailabilityState {}

class ServiceAvailabilityLoaded extends ServiceAvailabilityState {
  final List<ServiceAvailability>? serviceAvailabilities;

  ServiceAvailabilityLoaded({this.serviceAvailabilities}) : assert(serviceAvailabilities != null);

  @override
  List<Object> get props => [serviceAvailabilities as Object];
}

class ServiceAvailabilityError extends ServiceAvailabilityState {}
