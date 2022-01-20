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
    String? timeAvailability,
    String? serviceName,
    DateTime? dateAvailability,
    BusinessPlace? place,
    String? serviceId,
    double? totalServicePrice,
    Pet? pet
    })
      : dateAvailability = dateAvailability ?? DateTime.now(),
      serviceName = serviceName ?? '',
      timeAvailability = timeAvailability ?? '',
      place = place ?? new BusinessPlace(name: ''),
      serviceId = serviceId ?? '',
      totalServicePrice = totalServicePrice ?? 0.0,
      pet = pet ?? new Pet(birthdate: DateTime.now(), createdAt: DateTime.now(), updatedAt: DateTime.now());


  BookingCartState copyWith({
    final String? serviceId,
    final String? serviceName,
    final BusinessPlace? place,
    final String? timeAvailability,
    final DateTime? dateAvailability,
    final double? totalServicePrice,
    final Pet? pet,
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