import 'package:aipetto/components/round_icon_button.dart';
import 'package:aipetto/modules/business/models/business.dart';
import 'package:aipetto/modules/businessPlace/widgets/business_place_item.dart';
import 'package:aipetto/modules/geolocation/bloc/user_geolocation_bloc.dart';
import 'package:aipetto/routes/routes.dart';
import 'package:aipetto/utils/constants.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class ChooseBusinessPlacePage extends StatefulWidget {

  @override
  _ChooseBusinessPlacePageState createState() =>_ChooseBusinessPlacePageState();

}
class _ChooseBusinessPlacePageState extends State<ChooseBusinessPlacePage>{

  @override
  void initState(){
    context.read<UserGeolocationBloc>().getCurrentLocation();
    super.initState();
  }

  @override
  void dispose(){
    context.read<UserGeolocationBloc>().cancelGeoCurrentLocation();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'businesses'.tr(),
        ),
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: () {  Navigator.of(context).pushNamed(
                  Routes.home
              ); },
              tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
            );
          },
        ),
        actions: <Widget>[
          IconButton(
            onPressed: () {
              Navigator.of(context).pushNamed(Routes.filter);
            },
            icon: Icon(
              Icons.filter_list,
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(20),
              child: Text(
                'choose_a_business_place'.tr(),
                style: Theme.of(context).textTheme.headline6.copyWith(
                      fontWeight: FontWeight.w700,
                    ),
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(
                horizontal: 20,
              ),
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4),
                color:kAmphibianColorGreenLight,
              ),
              child: Row(
                children: <Widget>[
                RoundIconButton(
                    onPressed: () {},
                    icon: Icons.person_pin,
                  ),
                  SizedBox(
                    width: 20,
                  ),
                Expanded(
                    child: Text(
                      'geo_location_address'.tr(),
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                      ),
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            ListView.separated(
              separatorBuilder: (context, index) => Divider(),
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: businesses.length,
              itemBuilder: (context, index) {
                return BusinessPlaceItem(
                  onTap: () {
                    Navigator.of(context).pushNamed(Routes.bookingStep2DetailsOfPlace); /// TODO pass id selected in the list for the step 2 page
                  },
                  business: businesses[index],
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
