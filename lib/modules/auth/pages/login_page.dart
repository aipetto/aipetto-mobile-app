import 'package:aipetto/components/custom_button.dart';
import 'package:aipetto/components/labeled_text_form_field.dart';
import 'package:aipetto/config/pref_manager.dart';
import 'package:aipetto/modules/auth/bloc/authentication.dart';
import 'package:aipetto/modules/auth/bloc/login/login_bloc.dart';
import 'package:aipetto/modules/auth/bloc/login/login_event.dart';
import 'package:aipetto/modules/auth/bloc/login/login_state.dart';
import 'package:aipetto/modules/auth/services/auth_service.dart';
import 'package:aipetto/modules/i18n/models/Language.dart';
import 'package:aipetto/routes/routes.dart';
import 'package:aipetto/splash_page.dart';
import 'package:aipetto/utils/constants.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:http/http.dart' as http;

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        minimum: EdgeInsets.all(16),
        child: BlocBuilder<AuthenticationBloc, AuthenticationState>(
            builder: (context, state) {
          final authBloc = BlocProvider.of<AuthenticationBloc>(context);
          if (state is AuthenticationNotAuthenticated) {
            return _AuthForm();
          }

          if (state is AuthenticationFailure) {
            return Center(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text(state.message),
                FlatButton(
                  textColor: Theme.of(context).primaryColor,
                  child: Text('Retry'),
                  onPressed: () {
                    authBloc.add(AppLoaded());
                  },
                )
              ],
            ));
          }

          if (state is AuthenticationAuthenticated) {
            return SplashPage();
          }

          return Center(
              child: CircularProgressIndicator(
            strokeWidth: 2,
          ));
        }),
      ),
    );
  }
}

class _AuthForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final AuthenticationService authService =
        AipettoCoreAuthenticationService(httpClient: http.Client());
    final authBloc = BlocProvider.of<AuthenticationBloc>(context);

    return Container(
      alignment: Alignment.center,
      child: BlocProvider<LoginBloc>(
        create: (context) => LoginBloc(authBloc, authService),
        child: _SignInForm(),
      ),
    );
  }
}

class _SignInForm extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _SignInFormState();
}

class _SignInFormState extends State<_SignInForm> {
  var _language;

  @override
  void initState() {
    super.initState();

    switch (Prefs.getString('language', def: 'pt')) {
      case 'pt':
        _language = Language.portuguese;
        break;

      case 'en':
        _language = Language.english;
        break;

      case 'es':
        _language = Language.spanish;
        break;

      default:
        break;
    }
  }

  _changeLanguage(int index) {
    switch (index) {
      case 0:
        _language = Language.portuguese;
        Prefs.setString(Prefs.LANGUAGE, 'pt');
        Prefs.setString(Prefs.LANGUAGE_REGION, 'BR');
        Prefs.setString(Prefs.LANGUAGE_ID, '6096a50ab5704301f1e7b535');
        break;

      case 1:
        _language = Language.english;
        Prefs.setString(Prefs.LANGUAGE, 'en');
        Prefs.setString(Prefs.LANGUAGE_REGION, 'UK');
        Prefs.setString(Prefs.LANGUAGE_ID, '6096a50fb57043bb3ae7b537');
        break;

      case 2:
        _language = Language.spanish;
        Prefs.setString(Prefs.LANGUAGE, 'es');
        Prefs.setString(Prefs.LANGUAGE_REGION, 'AR');
        Prefs.setString(Prefs.LANGUAGE_ID, '6096a507b570431faae7b533');
        break;
    }
    context.setLocale(Locale(Prefs.getString(Prefs.LANGUAGE),
        Prefs.getString(Prefs.LANGUAGE_REGION)));
  }

  final GlobalKey<FormState> _key = GlobalKey<FormState>();
  final _passwordController = TextEditingController();
  final _emailController = TextEditingController();
  bool _autoValidate = false;

  @override
  Widget build(BuildContext context) {
    final _loginBloc = BlocProvider.of<LoginBloc>(context);

    _onGoogleSignInButtonPressed() {
      _loginBloc.add(GoogleSignInButtonPressed());
    }

    _onLoginButtonPressed() {
      if (_key.currentState.validate()) {
        _loginBloc.add(LoginInWithEmailButtonPressed(
            email: _emailController.text, password: _passwordController.text));
      } else {
        setState(() {
          _autoValidate = true;
        });
      }
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),
      body: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints viewportConstraints) {
          return BlocListener<LoginBloc, LoginState>(
              listener: (context, state) {
            if (state is LoginFailure) {
              _showError(state.error);
            }
          }, child:
                  BlocBuilder<LoginBloc, LoginState>(builder: (context, state) {
            if (state is LoginLoading) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
            return Form(
              key: _key,
              autovalidateMode: _autoValidate
                  ? AutovalidateMode.always
                  : AutovalidateMode.disabled,
              child: SingleChildScrollView(
                physics: ClampingScrollPhysics(),
                child: ConstrainedBox(
                  constraints: BoxConstraints(
                    minHeight: viewportConstraints.maxHeight,
                  ),
                  child: IntrinsicHeight(
                    child: Column(
                      children: <Widget>[
                        Image.asset('assets/images/dog-house.jpg', width: 300),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 38),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                MaterialButton(
                                  splashColor: Colors.transparent,
                                  height: 40,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8)),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Icon(FontAwesomeIcons.google,
                                          color: Colors.white),
                                      Text('sign_in_google'.tr(),
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 17))
                                    ],
                                  ),
                                  color: kAmphibianColorBlueDark,
                                  onPressed: () {
                                    _onGoogleSignInButtonPressed();
                                  },
                                ),
                                Expanded(
                                  child: SizedBox(
                                    height: 20,
                                  ),
                                ),
                                RadioListTile(
                                  value: Language.portuguese,
                                  onChanged: (value) => _changeLanguage(0),
                                  groupValue: _language,
                                  title: Text('portuguese'.tr()),
                                ),
                                Divider(
                                  height: 0.5,
                                  indent: 10,
                                  endIndent: 10,
                                ),
                                RadioListTile(
                                  value: Language.english,
                                  onChanged: (value) => _changeLanguage(1),
                                  groupValue: _language,
                                  title: Text('english'.tr()),
                                ),
                                Divider(
                                  height: 0.5,
                                  indent: 10,
                                  endIndent: 10,
                                ),
                                RadioListTile(
                                  value: Language.spanish,
                                  onChanged: (value) => _changeLanguage(2),
                                  groupValue: _language,
                                  title: Text('spanish'.tr()),
                                ),
                                SizedBox(
                                  height: 30,
                                ),
                                Center(
                                  child: Text(
                                    'login_to_your_account_to_continue'.tr(),
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    LabeledTextFormField(
                                      title: 'email_dot'.tr(),
                                      controller: _emailController,
                                      keyboardType: TextInputType.emailAddress,
                                      hintText: 'email@email.com',
                                    ),
                                    LabeledTextFormField(
                                      title: 'password_dot'.tr(),
                                      controller: _passwordController,
                                      obscureText: true,
                                      hintText: '* * * * * *',
                                      padding: 0,
                                    ),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    CustomButton(
                                      onPressed: state is LoginLoading
                                          ? () {}
                                          : _onLoginButtonPressed,
                                      text: 'login'.tr(),
                                    ),
                                    Row(
                                      children: [
                                        Expanded(
                                          child: Container(),
                                        ),
                                        FlatButton(
                                          onPressed: () {
                                            Navigator.of(context).pushNamed(
                                                Routes.forgotPassword);
                                          },
                                          child: Text(
                                            'forgot_yout_password'.tr(),
                                            style: Theme.of(context)
                                                .textTheme
                                                .button
                                                .copyWith(fontSize: 14),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          }));
        },
      ),
    );
  }

  void _showError(String error) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(error),
    ));
  }
}
