import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'i18n_event.dart';
part 'i18n_state.dart';

class i18nBloc extends Bloc<i18nEvent, i18nState> {
  i18nBloc(i18nState initialState) : super(initialState);

  // TODO on language change update preferences
  // On every place we need the location now we consume from the bloc

  @override
  Stream<i18nState> mapEventToState(i18nEvent event) {
    // TODO: implement mapEventToState
    throw UnimplementedError();
  }
}
