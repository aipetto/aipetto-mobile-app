import 'package:aipetto/bloc/pet_type/pet_type_bloc.dart';
import 'package:aipetto/data/pref_manager.dart';
import 'package:aipetto/repositories/petType/petTypeApiClient.dart';
import 'package:aipetto/repositories/petType/pet_type_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:aipetto/bloc/user_geolocation/user_geolocation_bloc.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;

import 'routes/route_generator.dart';
import 'routes/routes.dart';
import 'utils/themebloc/theme_bloc.dart';

void main() async {

  WidgetsFlutterBinding.ensureInitialized();
  await Prefs.load();
  await EasyLocalization.ensureInitialized();

  final PetTypeRepository petTypeRepository = PetTypeRepository(
      petTypeClient: PetTypeApiClient(
          httpClient: http.Client(),
  ));

  runApp(
    EasyLocalization(
      child: MyApp(
        petTypeRepository: petTypeRepository,
      ),
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

  final PetTypeRepository petTypeRepository;

  const MyApp({Key key, this.petTypeRepository}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => ThemeBloc()),
        BlocProvider(create: (_) => UserGeolocationBloc()),
        BlocProvider(create: (_) => PetTypeBloc(repository: petTypeRepository))
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
      initialRoute: Routes.splash,
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
