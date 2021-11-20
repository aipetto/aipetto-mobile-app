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
           height: 250,
           width: double.infinity,
           child: ClipRRect(
             child: (widget.pet.profileImage != null &&
                 widget.pet.profileImage.length > 0 &&
                 widget.pet.profileImage[0] != null &&
                 widget.pet.profileImage[0].publicUrl != null)
                 ? Image.network(widget.pet.profileImage[0].publicUrl, fit: BoxFit.cover)
                 : Image.asset('assets/images/aipetto/pets.png', fit: BoxFit.cover),
           ),
          ),
          Container(
            padding: EdgeInsets.all(20),
            //color: Colors.white,
            child: Row(
              children: <Widget>[
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
                        height: 3,
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
            height: 5,
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
                        bottom: BorderSide(
                          width: 1,
                          color: _isdark
                              ? Colors.black87
                              : kAmphibianColorBlueDarkAlternative,
                        ),
                      ),
                    ),
                    child: TabBar(
                      indicatorColor: kColorPrimary,
                      labelStyle: kTabTextStyle,
                      unselectedLabelStyle: kUnselectedTabTextStyle,
                      labelColor: kColorPrimary,
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
