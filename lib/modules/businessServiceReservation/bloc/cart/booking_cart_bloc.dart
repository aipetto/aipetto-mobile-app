import 'package:aipetto/modules/businessPlace/models/business_place.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'booking_cart_event.dart';
part 'booking_cart_state.dart';

class BookingCartBloc extends Bloc<BookingCartEvent, BookingCartState> {

  BookingCartBloc() : super(BookingCartState());

  @override
  Stream<BookingCartState> mapEventToState(BookingCartEvent event) async* {

    if(event is AddBookingService) {
      yield BookingCartState(
          totalServicePrice: event.totalServicePrice,
          serviceId: event.serviceId,
          serviceName: event.serviceName,
          place: event.businessPlace
      );
    }

    if(event is ChangeBookingCartAvailability){
      yield state.copyWith(timeAvailability: event.timeAvailability, dateAvailability: event.dateAvailability);
    }
  }
}