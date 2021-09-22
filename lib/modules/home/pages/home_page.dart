import 'package:aipetto/modules/business/models/business.dart';
import 'package:aipetto/modules/businessServiceReservation/widgets/reserved_past_business_list_item.dart';
import 'package:aipetto/modules/home/widgets/next_appointment_widget.dart';
import 'package:aipetto/modules/home/widgets/no_appointments_widget.dart';
import 'package:aipetto/modules/home/widgets/section_header_widget.dart';
import 'package:aipetto/modules/pet/widgets/pet_horizontal_listing.dart';
import 'package:aipetto/modules/user/models/user.dart';
import 'package:aipetto/routes/routes.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

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

    if (widget.user != null){
       firstName = widget.user.firstName;
    }

    return Scaffold(
      body: SingleChildScrollView(
      child: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              children: <Widget>[
                ///TopHeaderRounded,
                Image.asset('assets/images/hand.png'),
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
                        color: Colors.grey,
                        fontSize: 14,
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
                Column(
                  children: <Widget>[
                    PetHorizontalList()
                  ],
                ),
                _noAppoints
                    ? NoAppointmentsWidget()
                    : Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
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
                          SizedBox(
                            height: 20,
                          ),
                          Container(
                            height: 160,
                            child: ListView.separated(
                              separatorBuilder: (context, index) => SizedBox(
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
                        ],
                      ),
                ],
              ),
            ),
         ],
        ),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
