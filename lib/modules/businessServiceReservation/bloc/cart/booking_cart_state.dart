part of 'booking_cart_bloc.dart';

class BookingCartState {
  final String serviceId;
  final String serviceName;
  final double totalServicePrice;
  final BusinessPlace place;
  final DateTime dateAvailability;
  final String timeAvailability;
  final Pet pet;

  BookingCartState({
    String timeAvailability,
    String serviceName,
    DateTime dateAvailability,
    BusinessPlace place,
    String serviceId,
    double totalServicePrice,
    Pet pet
    })
      : dateAvailability = dateAvailability ?? null,
      serviceName = serviceName ?? null,
      timeAvailability = timeAvailability ?? null,
      place = place ?? null,
      serviceId = serviceId ?? null,
      totalServicePrice = totalServicePrice ?? null,
      pet = pet ?? null;


  BookingCartState copyWith({
    final String serviceId,
    final String serviceName,
    final BusinessPlace place,
    final String timeAvailability,
    final DateTime dateAvailability,
    final double totalServicePrice,
    final Pet pet,
  }) => BookingCartState(
    serviceId: serviceId ?? this.serviceId,
    serviceName: serviceName ?? this.serviceName,
    place: place ?? this.place,
    dateAvailability: dateAvailability ?? this.dateAvailability,
    timeAvailability: timeAvailability ?? this.timeAvailability,
    totalServicePrice: totalServicePrice ?? this.totalServicePrice,
    pet: pet ?? this.pet
  );
}