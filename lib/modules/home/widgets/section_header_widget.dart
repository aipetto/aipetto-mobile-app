import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';

class SectionHeaderWidget extends StatelessWidget {
  final String title;
  final void Function()? onPressed;

  const SectionHeaderWidget({
    required this.title,
    this.onPressed,
  });
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10),
      child: Row(
        children: <Widget>[
          Expanded(
            child: Text(
              title,
              style: Theme.of(context).textTheme.headline6?.copyWith(
                    fontWeight: FontWeight.w700,
                  ),
            ),
          ),
          SizedBox(
            width: 5,
          ),
          onPressed != null
              ? FlatButton(
                  onPressed: onPressed,
                  child: Text(
                    'see_all'.tr(),
                    style: Theme.of(context).textTheme.button?.copyWith(
                          fontSize: 14,
                        ),
                  ),
                )
              : Container(),
        ],
      ),
    );
  }
}
