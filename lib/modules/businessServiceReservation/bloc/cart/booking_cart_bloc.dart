import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:aipetto/modules/businessServiceAvailability/models/service_availabilities.dart';

part 'booking_cart_state.dart';

part 'booking_cart_event.dart';

class BookingCartBloc extends Bloc<BookingCartEvent, BookingCartState> {

  BookingCartBloc() : super(BookingCartState());

  @override
  Stream<BookingCartState> mapEventToState(BookingCartEvent event) {
    print('ok');
  }
}