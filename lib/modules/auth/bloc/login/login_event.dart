import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';

@immutable
abstract class LoginEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class LoginInWithEmailButtonPressed extends LoginEvent {
  final String email;
  final String password;

  LoginInWithEmailButtonPressed(
      {@required this.email, @required this.password});

  @override
  List<Object> get props => [email, password];
}

class GoogleSignInButtonPressed extends LoginEvent {
  GoogleSignInButtonPressed();

  @override
  List<Object> get props => [];
}
