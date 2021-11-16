part of 'booking_cart_bloc.dart';

@immutable
abstract class BookingCartEvent {}

class AddBookingService extends BookingCartEvent{
  final double totalServicePrice;
  final String serviceId;
  final BusinessPlace businessPlace;

  AddBookingService({this.totalServicePrice, this.serviceId, this.businessPlace});

  @override
  String toString(){
    return 'Instance of BookingService in cart: ${this.serviceId} which belongs to ${this.businessPlace.name}';
  }
}

class AddBookingDateAndTime extends BookingCartEvent{
  final String timeAvailability;
  final DateTime dateAvailability;

  AddBookingDateAndTime({this.timeAvailability, this.dateAvailability});
}

class ChangeBookingCartService extends BookingCartEvent{
  final String serviceId;

  ChangeBookingCartService(this.serviceId);
}

class ChangeBookingCartAvailability extends BookingCartEvent{
  final String timeAvailability;
  final DateTime dateAvailability;

  ChangeBookingCartAvailability({this.timeAvailability, this.dateAvailability});
}

class GetBookingDateAndTime extends BookingCartEvent{

}