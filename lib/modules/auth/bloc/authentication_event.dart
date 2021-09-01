import 'package:aipetto/modules/user/models/user.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

abstract class AuthenticationEvent extends Equatable{

    const AuthenticationEvent();

    @override
    List<Object> get props => [];
}

// Fired just after the app is launched
class AppLoaded extends AuthenticationEvent{}

class UserLoggedIn extends AuthenticationEvent{

  final User user;

  UserLoggedIn({@required this.user});

  @override
  List<Object> get props => [user];
}

// Fired when the user has logged out
class UserLoggedOut extends AuthenticationEvent{}