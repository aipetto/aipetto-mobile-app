import 'package:aipetto/modules/auth/bloc/authentication_bloc.dart';
import 'package:aipetto/modules/auth/models/redirect_url.dart';
import 'package:aipetto/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CheckAuthenticationPage extends StatefulWidget {
  @override
  _CheckAuthenticationPage createState() => _CheckAuthenticationPage();
}

class _CheckAuthenticationPage extends State<CheckAuthenticationPage> with WidgetsBindingObserver {
  Future checkUserAuthentication;

  @override
  void initState() {
    WidgetsBinding.instance.addObserver(this);
    checkUserAuthentication = checkUserIsAuthenticatedOrNot();
    super.initState();
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: FutureBuilder(
          future: checkUserAuthentication,
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.hasData) {
              return Center(child: Text(snapshot.data));
            } else {
              return Center(
                child: CircularProgressIndicator(strokeWidth: 2),
              );
            }
          },
        ));
  }

  Future checkUserIsAuthenticatedOrNot() async {

    await Future.delayed(Duration(milliseconds: 500));

    final authenticationUserState =
        BlocProvider.of<AuthenticationBloc>(context).state;
    if (authenticationUserState is AuthenticationAuthenticated) {
      Navigator.of(context).pushReplacementNamed(Routes.bookingStep3ServiceAvailability);
      return '';
    } else {
      Navigator.of(context).pushReplacementNamed(Routes.login,  arguments: RedirectUrl(Routes.bookingStep3ServiceAvailability));
    }
  }
}
