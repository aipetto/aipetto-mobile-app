import 'package:aipetto/config/pref_manager.dart';
import 'package:aipetto/modules/geolocation/bloc/user_geolocation_bloc.dart';
import 'package:aipetto/modules/petType/bloc/pet_type_bloc.dart';
import 'package:aipetto/routes/routes.dart';
import 'package:aipetto/splash_page.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;

import 'modules/auth/bloc/authentication_bloc.dart';
import 'modules/auth/bloc/authentication_event.dart';
import 'modules/auth/bloc/authentication_state.dart';
import 'modules/auth/pages/login_page.dart';
import 'modules/auth/services/auth_service.dart';
import 'modules/home/component/home.dart';
import 'modules/petType/repository/pet_type_repository.dart';
import 'modules/petType/services/petTypeApiClient.dart';
import 'routes/route_generator.dart';
import 'utils/themebloc/theme_bloc.dart';

void main() async {

  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  await Prefs.load();

  runApp(
    EasyLocalization(
      child: MyApp(),
      supportedLocales: [
        Locale('es', 'AR'),
        Locale('pt', 'BR'),
        Locale('en', 'UK'),
      ],
      path: 'assets/languages',
      fallbackLocale: Locale('en', 'UK'),
    ),
  );
}

class MyApp extends StatelessWidget {

  // TODO Refactor to use MultiRepositoryProvider<T> class to inject repositories in our app
  final PetTypeRepository petTypeRepository = PetTypeRepository(
      petTypeClient: PetTypeApiClient(
        httpClient: http.Client(),
      ));

  final AuthenticationService userRepository = AipettoCoreAuthenticationService(
      httpClient: http.Client()
  );

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => ThemeBloc()),
        BlocProvider(create: (_) => UserGeolocationBloc()),
        BlocProvider(create: (_) => PetTypeBloc(repository: petTypeRepository)),
        BlocProvider<AuthenticationBloc>(create: ( context ) {
          return AuthenticationBloc(userRepository)..add(AppLoaded());
        })
      ],
      child: BlocBuilder<ThemeBloc, ThemeState>(
        builder: _buildWithTheme,
      ),
    );
  }

  Widget _buildWithTheme(BuildContext context, ThemeState state) {
    return MaterialApp(
      builder: (context, child) {
        return ScrollConfiguration(
          behavior: MyBehavior(),
          child: child,
        );
      },
      title: 'aipetto',
      home: BlocBuilder<AuthenticationBloc, AuthenticationState>(
        builder: (context, state){
          if (state is AuthenticationAuthenticated) {
            return Home(
              user: state.user,
            );
          }
          return LoginPage();
        },
      ),
      onGenerateRoute: RouteGenerator.generateRoute,
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      debugShowCheckedModeBanner: false,
      theme: state.themeData,
    );
  }
}

class MyBehavior extends ScrollBehavior {
  @override
  Widget buildViewportChrome(
      BuildContext context, Widget child, AxisDirection axisDirection) {
    return child;
  }
}
