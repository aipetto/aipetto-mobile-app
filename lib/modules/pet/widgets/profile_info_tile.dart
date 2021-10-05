import 'package:aipetto/utils/constants.dart';
import 'package:flutter/material.dart';

import '../../../config/pref_manager.dart';

class ProfileInfoTile extends StatelessWidget {
  final String title, hint, trailing;

  const ProfileInfoTile(
      {Key key, @required this.title, this.hint, this.trailing})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    var _isDark = false;
    return Column(
      children: <Widget>[
        ListTile(
          title: Text(
            title,
            style: TextStyle(
              color: kAmphibianColorBlueDarkAlternative,
              fontSize: 14,
              fontWeight: FontWeight.w400,
            ),
          ),
          trailing: Text(
            trailing ?? hint,
            style: TextStyle(
              color: trailing != null
                  ? _isDark
                      ? Colors.white.withOpacity(0.87)
                      : Colors.black
                  : kAmphibianColorBlueDarkAlternative,
              fontSize: 14,
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
