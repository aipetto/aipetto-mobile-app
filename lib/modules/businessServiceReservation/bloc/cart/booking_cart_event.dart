part of 'booking_cart_bloc.dart';

@immutable
abstract class BookingCartEvent {}

class AddBookingService extends BookingCartEvent{
  final String serviceId;

  AddBookingService(this.serviceId);
}

class AddBookingDateAndTime extends BookingCartEvent{
  final ServiceAvailability availability;

  AddBookingDateAndTime(this.availability);
}

class GetBookingDateAndTime extends BookingCartEvent{

}