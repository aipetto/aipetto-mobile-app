part of 'booking_cart_bloc.dart';

@immutable
abstract class BookingCartEvent {}

class AddBookingService extends BookingCartEvent{
  final String serviceId;
  final BusinessPlace businessPlace;

  AddBookingService(this.serviceId, this.businessPlace);

  @override
  String toString(){
    return 'Instance of BookingService in cart: ${this.serviceId} which belongs to ${this.businessPlace.name}';
  }
}

class AddBookingDateAndTime extends BookingCartEvent{
  final ServiceAvailability availability;

  AddBookingDateAndTime(this.availability);
}

class ChangeBookingCartService extends BookingCartEvent{
  final String serviceId;

  ChangeBookingCartService(this.serviceId);
}

class ChangeBookingCartAvailability extends BookingCartEvent{
  final ServiceAvailability availability;

  ChangeBookingCartAvailability(this.availability);
}

class GetBookingDateAndTime extends BookingCartEvent{

}