import 'package:flutter/material.dart';

import '../../../utils/constants.dart';

class AppBarTitleWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Text.rich(
          TextSpan(
            children: [
              TextSpan(
                text: 'Aipetto',
                style: TextStyle(
                  color: kAmphibianColorGreenLight,
                  fontSize: 26,
                  fontWeight: FontWeight.w900,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
