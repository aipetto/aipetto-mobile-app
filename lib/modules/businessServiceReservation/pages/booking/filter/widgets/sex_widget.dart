import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';

class SexWidget extends StatefulWidget {
  final Color color;

  const SexWidget({required this.color});
  @override
  _SexWidgetState createState() => _SexWidgetState();
}

class _SexWidgetState extends State<SexWidget> {
  bool? _male = false;
  bool? _female = false;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
          width: double.infinity,
          color: widget.color,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
            child: Text(
              'sex'.tr(),
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
        ),
        CheckboxListTile(
          value: _male,
          onChanged: (value) {
            setState(() {
              _male = value;
            });
          },
          title: Text('male_veterinarian'.tr()),
        ),
        CheckboxListTile(
          value: _female,
          onChanged: (value) {
            setState(() {
              _female = value;
            });
          },
          title: Text('female_veterinarian'.tr()),
        ),
      ],
    );
  }
}
