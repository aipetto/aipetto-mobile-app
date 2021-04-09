import 'package:flutter/material.dart';

import '../utils/constants.dart';

class CustomOutlineButton extends StatelessWidget {
  final String text;
  final Function onPressed;
  final double color;
  final int borderRadius;
  final EdgeInsets padding;
  final double textSize;

  const CustomOutlineButton({
    Key key,
    @required this.text,
    @required this.onPressed,
    this.color,
    this.borderRadius,
    this.padding,
    this.textSize,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return OutlineButton(
      onPressed: () {},
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(borderRadius ?? 4),
      ),
      borderSide: BorderSide(color: color ?? kColorPrimary, width: 1),
      child: Padding(
        padding: padding ??
            const EdgeInsets.only(top: 9, bottom: 10, left: 16, right: 16),
        child: Text(
          text,
          style: Theme.of(context).textTheme.button.copyWith(
              color: color ?? kColorPrimary,
              fontSize:
                  textSize ?? Theme.of(context).textTheme.button.fontSize),
          textAlign: TextAlign.center,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
      ),
    );
  }
}
