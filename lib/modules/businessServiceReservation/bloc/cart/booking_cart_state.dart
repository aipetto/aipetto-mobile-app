part of 'booking_cart_bloc.dart';

class BookingCartState {
  final String serviceId;
  final BusinessPlace place;
  final ServiceAvailability availability;

  BookingCartState({ ServiceAvailability availability, BusinessPlace place, String serviceId})
      : availability = availability ?? null,
      place = place ?? null,
      serviceId = serviceId ?? null;
}