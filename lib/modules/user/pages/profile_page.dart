import 'package:aipetto/components/round_icon_button.dart';
import 'package:aipetto/config/pref_manager.dart';
import 'package:aipetto/modules/exam/pages/visit_page.dart';
import 'package:aipetto/modules/pet/pages/pet_info_page.dart';
import 'package:aipetto/modules/vaccine/pages/vaccine_page.dart';
import 'package:aipetto/routes/routes.dart';
import 'package:aipetto/utils/constants.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class UserProfilePage extends StatefulWidget {
  @override
  _UserProfilePageState createState() => _UserProfilePageState();
}

class _UserProfilePageState extends State<UserProfilePage>
    with AutomaticKeepAliveClientMixin<UserProfilePage> {
  final _kTabTextStyle = TextStyle(
    color:kAmphibianColorGreenLight,
    fontSize: 14,
    fontWeight: FontWeight.w400,
    fontStyle: FontStyle.normal,
  );

  final _kTabPages = [
    PetInfoPage(),
    VisitPage(),
    VaccinePage(),
  ];

  @override
  Widget build(BuildContext context) {
    super.build(context);
    bool _isdark = true;

    var _kTabs = [
      Tab(
        text: 'pet_info'.tr(),
      ),
      Tab(
        text: 'visit'.tr(),
      ),
      Tab(
        text: 'vaccines'.tr(),
      ),
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text('pet_profile'.tr()),
      ),
      body: Column(
      children: <Widget>[
        Container(
          padding: EdgeInsets.all(20),
          //color: Colors.white,
          child: Row(
            children: <Widget>[
              Padding(
              padding: EdgeInsets.symmetric(vertical: 30),
               child: CircleAvatar(
                  radius: 62,
                  backgroundColor: Colors.transparent,
                  backgroundImage: AssetImage(
                    'assets/images/pets/snoopy-2.jpg',
                  ),
                ),
              ),
              SizedBox(
                width: 20,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      'Snoopy',
                      style: Theme.of(context).textTheme.subtitle2,
                    ),
                    SizedBox(
                      height: 3,
                    ),
                    Text(
                      'Breed Name',
                      style: TextStyle(
                        color: Colors.grey[350],
                        fontSize: 14,
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      '7yr',
                      style: Theme.of(context)
                          .textTheme
                          .subtitle2
                          .copyWith(fontSize: 14),
                    ),
                  ],
                ),
              ),
              RoundIconButton(
                onPressed: () =>
                    Navigator.of(context).pushNamed(Routes.editPetProfile),
                icon: Icons.edit,
                size: 40,
                color:kAmphibianColorGreenLight,
                iconColor: Colors.white,
              ),
            ],
          ),
        ),
        SizedBox(
          height: 15,
        ),
        Expanded(
          child: DefaultTabController(
            length: _kTabs.length,
            child: Column(
              children: <Widget>[
                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: _isdark ? kColorDark : Color(0xfffbfcff),
                    border: Border(
                      top: BorderSide(
                        width: 1,
                        color: _isdark ? Colors.black87 : Colors.grey[200],
                      ),
                      bottom: BorderSide(
                        width: 1,
                        color: _isdark ? Colors.black87 : Colors.grey[200],
                      ),
                    ),
                  ),
                  child: TabBar(
                    indicatorColor:kAmphibianColorGreenLight,
                    labelStyle: _kTabTextStyle,
                    unselectedLabelStyle:
                        _kTabTextStyle.copyWith(color: Colors.grey),
                    labelColor:kAmphibianColorGreenLight,
                    unselectedLabelColor: Colors.grey,
                    tabs: _kTabs,
                  ),
                ),
                Expanded(
                  child: TabBarView(
                    children: _kTabPages,
                  ),
                ),
              ],
            ),
          ),
        )
      ],
    ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
