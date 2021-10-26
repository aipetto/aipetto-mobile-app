import 'package:aipetto/components/round_icon_button.dart';
import 'package:aipetto/modules/exam/pages/visit_page.dart';
import 'package:aipetto/modules/pet/models/pets.dart';
import 'package:aipetto/modules/pet/pages/pet_info_page.dart';
import 'package:aipetto/modules/vaccine/pages/vaccine_page.dart';
import 'package:aipetto/routes/routes.dart';
import 'package:aipetto/utils/constants.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class PetProfilePage extends StatefulWidget {
  final Pet pet;

  const PetProfilePage({Key key, this.pet}) : super(key: key);

  @override
  _PetProfilePageState createState() => _PetProfilePageState();
}

class _PetProfilePageState extends State<PetProfilePage>
    with AutomaticKeepAliveClientMixin<PetProfilePage> {
  final _kTabTextStyle = TextStyle(
    color: kAmphibianColorBlueDarkAlternative,
    fontSize: 16,
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
    bool _isdark = false;
    final String petAgeInMonths =
        widget.pet.age != null ? '${widget.pet.age}' + 'details'.tr() : '';

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
        title: Text('pet_profile'.tr(),
            style: Theme.of(context).textTheme.subtitle1.copyWith(
                fontWeight: FontWeight.w700,
                color: Colors.white,
                fontSize: 16)),
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
                    radius: 82,
                    backgroundColor: Colors.transparent,
                    backgroundImage: (widget.pet.profileImage != null &&
                            widget.pet.profileImage.length > 0 &&
                            widget.pet.profileImage[0] != null &&
                            widget.pet.profileImage[0].publicUrl != null)
                        ? NetworkImage(widget.pet.profileImage[0].publicUrl)
                        : AssetImage('assets/images/aipetto/pets.png'),
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
                        widget.pet.name ?? '',
                        style: Theme.of(context)
                            .textTheme
                            .subtitle2
                            .copyWith(fontSize: 18),
                      ),
                      SizedBox(
                        height: 3,
                      ),
                      Text(
                        widget.pet.breed ?? '',
                        style: TextStyle(
                          color: kAmphibianColorBlueDarkAlternative,
                          fontSize: 18,
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        '$petAgeInMonths',
                        style: Theme.of(context)
                            .textTheme
                            .subtitle2
                            .copyWith(fontSize: 16),
                      ),
                    ],
                  ),
                ),
                RoundIconButton(
                  onPressed: () =>
                      Navigator.of(context).pushNamed(Routes.editPetProfile),
                  icon: Icons.edit,
                  size: 40,
                  color: kAmphibianColorGreenLight,
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
                          color: _isdark
                              ? Colors.black87
                              : kAmphibianColorBlueDarkAlternative,
                        ),
                        bottom: BorderSide(
                          width: 1,
                          color: _isdark
                              ? Colors.black87
                              : kAmphibianColorBlueDarkAlternative,
                        ),
                      ),
                    ),
                    child: TabBar(
                      indicatorColor: kAmphibianColorGreenLight,
                      labelStyle: _kTabTextStyle,
                      unselectedLabelStyle: _kTabTextStyle.copyWith(
                          color: kAmphibianColorBlueDarkAlternative),
                      labelColor: kAmphibianColorGreenLight,
                      unselectedLabelColor: kAmphibianColorBlueDarkAlternative,
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
