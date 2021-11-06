part of 'booking_cart_bloc.dart';

class BookingCartState {
  final String serviceId;
  final ServiceAvailability availability;

  BookingCartState({ ServiceAvailability availability, String serviceId})
      : availability = availability ?? null,
      serviceId = serviceId ?? null;
}