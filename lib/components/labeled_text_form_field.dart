import 'package:flutter/material.dart';

import '../utils/constants.dart';
import 'text_form_field.dart';

class LabeledTextFormField extends StatelessWidget {
  final String title;
  final double padding;
  final TextEditingController controller;
  final String hintText;
  final bool obscureText;
  final bool enabled;
  final Widget suffixIcon;
  final bool suffixIconTap;
  final String error;
  final TextInputType keyboardType;
  final Function validator;

  const LabeledTextFormField({
    Key key,
    @required this.title,
    this.padding,
    this.controller,
    this.hintText,
    this.obscureText,
    this.enabled,
    this.suffixIcon,
    this.suffixIconTap,
    this.error,
    this.keyboardType,
    this.validator,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: padding ?? 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            title,
            style: kInputTextStyle,
          ),
          CustomTextFormField(
            controller: controller,
            keyboardType: keyboardType,
            hintText: hintText,
            enabled: enabled,
            error: error,
            obscureText: obscureText,
            suffixIcon: suffixIcon,
            suffixIconTap: suffixIconTap,
            validator: validator,
          ),
        ],
      ),
    );
  }
}
