import 'package:aipetto/modules/auth/services/auth_service.dart';
import 'package:aipetto/modules/business/models/business.dart';
import 'package:aipetto/modules/businessServiceReservation/widgets/reserved_past_business_list_item.dart';
import 'package:aipetto/modules/home/widgets/next_appointment_widget.dart';
import 'package:aipetto/modules/home/widgets/no_appointments_widget.dart';
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

class HomePage extends StatefulWidget {
  final User user;

  const HomePage({Key key, this.user}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with AutomaticKeepAliveClientMixin<HomePage> {
  final bool _noAppoints = false;

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
                    SizedBox(
                      height: 20,
                    ),
                    _noAppoints
                        ? NoAppointmentsWidget()
                        : Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              GestureDetector(
                                onTap: () {
                                  FocusScope.of(context).requestFocus(FocusNode());
                                  Navigator.of(context)
                                      .pushNamed(Routes.myAppointments);
                                },
                                child: Padding(
                                  padding:
                                      const EdgeInsets.symmetric(horizontal: 20),
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
                                  itemCount: 3,
                                  scrollDirection: Axis.horizontal,
                                  padding: EdgeInsets.symmetric(horizontal: 20),
                                  itemBuilder: (context, index) {
                                    return ReservedPastBussinessListItem(
                                      business: businesses[index],
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
