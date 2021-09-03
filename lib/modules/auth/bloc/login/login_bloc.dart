import 'package:aipetto/modules/auth/bloc/authentication.dart';
import 'package:aipetto/modules/auth/bloc/login/login_state.dart';
import 'package:aipetto/modules/auth/exceptions/exceptions.dart';
import 'package:aipetto/modules/auth/services/auth_service.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'login_event.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {

  final AuthenticationBloc _authenticationBloc;
  final AuthenticationService _authenticationService;

  LoginBloc(AuthenticationBloc authenticationBloc, AuthenticationService authenticationService)
      : assert(authenticationBloc != null),
        assert(authenticationService != null),
        _authenticationService = authenticationService,
        _authenticationBloc = authenticationBloc,
      super(LoginInitial());

  @override
  Stream<LoginState> mapEventToState(LoginEvent event) async* {
    if (event is LoginInWithEmailButtonPressed) {
      yield* _mapLoginWithEmailToState(event);
    }

    if (event is GoogleSignInButtonPressed) {
      yield* _mapLoginWithGoogleSignInToState(event);
    }
  }

  Stream<LoginState> _mapLoginWithEmailToState(LoginInWithEmailButtonPressed event) async* {
    yield LoginLoading();
    try{
      final user = await _authenticationService.signInWithEmailAndPassword(event.email, event.password);
      if (user != null ){
        _authenticationBloc.add(UserLoggedIn(user: user));
        yield LoginSuccess();
        yield LoginInitial();
      } else {
        yield LoginFailure(error: 'failure_to_login'.tr());
      }
    } on AuthenticationException catch(e){
      yield LoginFailure(error: e.message);
    } catch( err ){
      yield LoginFailure(error: 'unknown_failure_error'.tr());
    }
  }

  Stream<LoginState> _mapLoginWithGoogleSignInToState(GoogleSignInButtonPressed event) async* {
    yield LoginLoading();
    try {
      final user = await _authenticationService.signInWithGoogle();
      if (user != null) {
        _authenticationBloc.add(UserLoggedIn(user: user));
        yield LoginSuccess();
        yield LoginInitial();
      } else {
        yield LoginFailure(error: 'failure_to_google_sign_in'.tr());
      }
    } on AuthenticationException catch(e) {
      yield LoginFailure(error: e.message);
    } catch(err) {
      yield LoginFailure(error: 'unknown_failure_error'.tr());
    }
  }

}