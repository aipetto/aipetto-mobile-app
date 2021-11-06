import 'package:aipetto/config/pref_manager.dart';
import 'package:aipetto/modules/geolocation/bloc/user_geolocation_bloc.dart';
import 'package:aipetto/modules/onboarding/widgets/OnBoardingPage.dart';
import 'package:aipetto/modules/pet/repository/pet_repository.dart';
import 'package:aipetto/modules/pet/services/petApiClient.dart';
import 'package:aipetto/utils/app_themes.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'package:in_app_update/in_app_update.dart';

import 'modules/auth/bloc/authentication_bloc.dart';
import 'modules/auth/services/auth_service.dart';
import 'modules/home/component/home.dart';
import 'modules/pet/bloc/pet_bloc.dart';
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
      fallbackLocale: Locale('pt', 'BR'),
    ),
  );
}

class MyApp extends StatelessWidget {
  final AuthenticationService userRepository =
      AipettoCoreAuthenticationService(httpClient: http.Client());

  final PetRepository petRepository = PetRepository(
      petClient: PetApiClient(
    httpClient: http.Client(),
  ));

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle.dark.copyWith(statusBarColor: Colors.transparent),
    );

    return MultiBlocProvider(
      providers: [
        BlocProvider<ThemeBloc>(create: (context) => ThemeBloc()),
        BlocProvider<UserGeolocationBloc>(create: (_) => UserGeolocationBloc()),
        BlocProvider<PetBloc>(create: (context) {
          return PetBloc(
              authenticationService: userRepository,
              petRepository: petRepository)
            ..add(FetchPets());
        }),
        BlocProvider<AuthenticationBloc>(create: (context) {
          return AuthenticationBloc(userRepository)..add(AppLoaded());
        }),
      ],
      child: BlocBuilder<ThemeBloc, ThemeState>(
        builder: _buildWithTheme,
      ),
    );
  }

  Widget _buildWithTheme(BuildContext context, ThemeState state) {
    context.bloc<ThemeBloc>().add(ThemeChanged(theme: AppTheme.LightTheme));

    return MaterialApp(
      builder: (context, child) {
        return ScrollConfiguration(
          behavior: MyBehavior(),
          child: child,
        );
      },
      title: 'aipetto',
      home: BlocBuilder<AuthenticationBloc, AuthenticationState>(
        builder: (context, state) {
          if (state is AuthenticationAuthenticated) {
            return Home(
              user: state.user,
            );
          }
          if (state is AuthenticationNotAuthenticated) {
            return OnBoardingPage();
          }
          if (state is AuthenticationLoading) {
            return LoadingIndicator();
          }
          return OnBoardingPage();
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

  Widget LoadingIndicator() {
    return Center(
        child: CircularProgressIndicator(
      strokeWidth: 2,
    ));
  }
}

class MyBehavior extends ScrollBehavior {
  @override
  Widget buildViewportChrome(
      BuildContext context, Widget child, AxisDirection axisDirection) {
    return child;
  }
}
