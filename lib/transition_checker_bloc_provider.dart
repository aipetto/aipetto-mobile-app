import 'package:bloc/bloc.dart';

class TransitionCheckerBlocProvider extends BlocObserver {

  @override
  void onEvent(Bloc bloc, Object event) {
    super.onTransition(bloc, event);
    print('onEvent $event');
  }

  @override
  void onChange(Cubit bloc, Change change) {
    super.onChange(bloc, change);
    print('onChange $change');
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    super.onTransition(bloc, transition);
    print('onTransition $transition');
  }

  @override
  void onError(Cubit bloc, Object error, StackTrace stackTrace) {
    print(error);
    super.onError(bloc, error, stackTrace);
  }
}