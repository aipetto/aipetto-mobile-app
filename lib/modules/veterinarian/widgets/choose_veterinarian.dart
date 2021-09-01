import 'package:aipetto/components/round_icon_button.dart';
import 'package:aipetto/modules/veterinarian/models/veterinarian.dart';
import 'package:aipetto/modules/veterinarian/widgets/veterinarian_item.dart';
import 'package:aipetto/utils/constants.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class ChooseVeterinarian extends StatelessWidget {
  Widget _progress(int size, int progress) {
    List<Widget> widgets = [];
    for (var i = 0; i < size; i++) {
      widgets.add(
        Expanded(
          child: Container(
            margin: EdgeInsets.symmetric(
              horizontal: 5,
            ),
            height: 10,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              color: i < progress ? kAmphibianColorGreenLight : Colors.grey[300],
            ),
          ),
        ),
      );
    }
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
      child: Row(
        children: <Widget>[...widgets],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'veterinarian'.tr(),
        ),
        actions: <Widget>[
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.filter_list,
              color:kAmphibianColorGreenLight,
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            _progress(5, 2),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                'choose_a_veterinarian'.tr(),
                style: TextStyle(
                  color: kColorDarkBlue,
                  fontSize: 20,
                  fontFamily: 'NunitoSans',
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            SizedBox(
              height: 15,
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
                  Text(
                    'any_available_veterinarian'.tr(),
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            ListView.separated(
              separatorBuilder: (context, index) => Divider(
                color: Colors.grey[300],
                height: 1,
              ),
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: veterinarians.length,
              itemBuilder: (context, index) {
                return VeterinarianItem(
                  onTap: () {},
                  veterinarian: veterinarians[index],
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}