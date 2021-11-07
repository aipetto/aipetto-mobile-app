import 'package:aipetto/modules/auth/services/auth_service.dart';
import 'package:aipetto/modules/businessPlace/models/business_place.dart';
import 'package:aipetto/modules/businessServiceReservation/widgets/reserved_past_business_list_item.dart';
import 'package:aipetto/modules/home/widgets/next_appointment_widget.dart';
import 'package:aipetto/modules/home/widgets/section_header_widget.dart';
import 'package:aipetto/modules/pet/bloc/pet_bloc.dart';
import 'package:aipetto/modules/pet/repository/pet_repository.dart';
import 'package:aipetto/modules/pet/services/petApiClient.dart';
import 'package:aipetto/modules/pet/widgets/pet_horizontal_listing.dart';
import 'package:aipetto/modules/user/models/user.dart';
import 'package:aipetto/routes/routes.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'package:in_app_update/in_app_update.dart';

class HomePage extends StatefulWidget {
  final User user;

  const HomePage({Key key, this.user}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with AutomaticKeepAliveClientMixin<HomePage> {

  AppUpdateInfo _updateInfo;
  GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey();

  Future<void> checkForUpdate() async {
    InAppUpdate.checkForUpdate().then((info) {
      setState(() {
        _updateInfo = info;
      });
    }).catchError((e){
      showSnack(e.toString());
    });
  }

  void showSnack(String text) {
    if(_scaffoldKey.currentContext != null){
      ScaffoldMessenger.of(_scaffoldKey.currentContext)
          .showSnackBar(SnackBar(content: Text(text)));
    }
  }

  void initState() {
    super.initState();
    // Register a post frame callback to modify the widget
    WidgetsBinding.instance.addPostFrameCallback((_) => inmediateUpdate());
  }

  inmediateUpdate() {
    return _updateInfo?.updateAvailability ==
        UpdateAvailability.updateAvailable
        ? () {
      // Performs an immediate update that is entirely handled by the Google Play API.
      InAppUpdate.performImmediateUpdate()
          .catchError((e) => showSnack(e.toString()));
    }
    : null;
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    String firstName = '';

    if (widget.user != null) {
      firstName = widget.user.firstName;
    }

    final PetRepository petRepository = PetRepository(
        petClient: PetApiClient(
      httpClient: http.Client(),
    ));

    final AuthenticationService userRepository =
        AipettoCoreAuthenticationService(httpClient: http.Client());

    return Scaffold(
      body: BlocProvider<PetBloc>(
        create: (context) {
          return PetBloc(
              authenticationService: userRepository,
              petRepository: petRepository)
            ..add(FetchPets());
        },
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  children: <Widget>[
                    SizedBox(
                      height: 100,
                    ),
                    Image.asset('assets/images/logo_aipetto_60_60.png'),
                    SizedBox(
                      width: 10,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          '${'hello'.tr()} $firstName',
                          style: Theme.of(context).textTheme.headline6.copyWith(
                                fontWeight: FontWeight.w400,
                              ),
                        ),
                        Text(
                          'good_to_see_you_here'.tr(),
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontFamily: 'NunitoSans',
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    SizedBox(
                      height: 130,
                      child: Column(
                        children: <Widget>[PetHorizontalList()],
                      ),
                    ),
                    Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              ClipRRect(
                                borderRadius: BorderRadius.only(bottomLeft: Radius.circular(50.0), bottomRight: Radius.circular(50.0)),
                                child: Image.asset('assets/images/adopt-dogs-call.jpg',
                                  fit: BoxFit.cover,
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  FocusScope.of(context)
                                      .requestFocus(FocusNode());
                                  Navigator.of(context)
                                      .pushNamed(Routes.categories);
                                },
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 20),
                                  child: Column(
                                    children: <Widget>[
                                      SectionHeaderWidget(
                                        title: 'next_appointment'.tr(),
                                        onPressed: () => Navigator.of(context)
                                            .pushNamed(Routes.myAppointments),
                                      ),
                                      NextAppointmentWidget(),
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 20),
                                child: SectionHeaderWidget(
                                  title: 'my_favorite_business_places'.tr(),
                                  onPressed: () => Navigator.of(context)
                                      .pushNamed(Routes.myFavoriteBusinesses),
                                ),
                              ),
                              Container(
                                height: 180,
                                child: ListView.separated(
                                  separatorBuilder: (context, index) =>
                                      SizedBox(
                                    width: 15,
                                  ),
                                  itemCount: 1,
                                  scrollDirection: Axis.horizontal,
                                  padding: EdgeInsets.symmetric(horizontal: 20),
                                  itemBuilder: (context, index) {
                                    return ReservedPastBusinessListItem(
                                      businessPlace: staticBusinessesPlaces[index],
                                    );
                                  },
                                ),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                            ],
                          ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
