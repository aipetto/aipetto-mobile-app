import 'package:aipetto/components/pets_of_owner_list_item.dart';
import 'package:aipetto/components/reserved_past_business_list_item.dart';
import 'package:aipetto/model/business.dart';
import 'package:aipetto/model/pet.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../routes/routes.dart';
import 'widgets/widgets.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with AutomaticKeepAliveClientMixin<HomePage> {
  final bool _noAppoints = true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
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
                      '${'hello'.tr()} Jhony,',
                      style: Theme.of(context).textTheme.headline6.copyWith(
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    Text(
                      'how_are_you_today'.tr(),
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
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      height: 100,
                      child: ListView.separated(
                        separatorBuilder: (context, index) => SizedBox(
                          width: 15,
                        ),
                        itemCount: 1,
                        scrollDirection: Axis.horizontal,
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        itemBuilder: (context, index) {
                          return PetsOfOwnerListItem(
                            pet: pets[index],
                          );
                        },
                      ),
                    ),
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
                                ),
                                NextAppointmentWidget(),
                              ],
                            ),
                          ),
                          Container(
                            height: 160,
                            child: ListView.separated(
                              separatorBuilder: (context, index) => SizedBox(
                                width: 15,
                              ),
                              itemCount: 4,
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
