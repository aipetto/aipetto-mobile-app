import 'package:flutter/material.dart';
import 'package:aipetto/utils/constants.dart';

class ProfileInfoTile extends StatelessWidget {
  final String title;
  final String itemData;
  final bool boolItemData;

  const ProfileInfoTile(
      {required this.title, required this.itemData, required this.boolItemData});
  @override
  Widget build(BuildContext context) {
    var _isDark = false;
    return Column(
      children: <Widget>[
        boolItemData != null ?
          SwitchListTile(
            value: boolItemData,
            onChanged: (_) {},
            title: Text(
              title,
              style: Theme.of(context)
                  .textTheme
                  .subtitle1
                  ?.copyWith(fontWeight: FontWeight.w700),
            ),
          )
          :
          ListTile(
            title: Text(
              title,
              style: TextStyle(
                color: kAmphibianColorBlueDarkAlternative,
                fontSize: 16,
                fontWeight: FontWeight.w700,
              ),
            ),
            trailing: Text(
              itemData,
              style: TextStyle(
                color: itemData != null
                    ? _isDark
                        ? Colors.white.withOpacity(0.87)
                        : Colors.black
                    : kAmphibianColorBlueDarkAlternative,
                fontSize: 16,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
          Divider(
            height: 0.5,
            color: kAmphibianColorBlueDarkAlternative,
            indent: 15,
            endIndent: 15,
          ),
      ],
    );
  }
}
