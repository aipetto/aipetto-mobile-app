part of 'booking_cart_bloc.dart';

class BookingCartState {
  final String serviceId;
  final String serviceName;
  final double totalServicePrice;
  final BusinessPlace place;
  final DateTime dateAvailability;
  final String timeAvailability;

  BookingCartState({
    String timeAvailability,
    String serviceName,
    DateTime dateAvailability,
    BusinessPlace place,
    String serviceId,
    double totalServicePrice
    })
      : dateAvailability = dateAvailability ?? null,
      serviceName = serviceName ?? null,
      timeAvailability = timeAvailability ?? null,
      place = place ?? null,
      serviceId = serviceId ?? null,
      totalServicePrice = totalServicePrice ?? null;

  BookingCartState copyWith({
    final String serviceId,
    final String serviceName,
    final BusinessPlace place,
    final String timeAvailability,
    final DateTime dateAvailability,
    final double totalServicePrice,
  }) => BookingCartState(
    serviceId: serviceId ?? this.serviceId,
    serviceName: serviceName ?? this.serviceName,
    place: place ?? this.place,
    dateAvailability: dateAvailability ?? this.dateAvailability,
    timeAvailability: timeAvailability ?? this.timeAvailability,
    totalServicePrice: totalServicePrice ?? this.totalServicePrice
  );
}