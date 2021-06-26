import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

Function(BuildContext, String) placeholderWidgetFn() => (_, s) => placeholderWidget();

Widget placeholderWidget() => Image.asset('assets/images/LikeButton/image/grey.jpg', fit: BoxFit.cover);

void changeStatusColor(Color color) async {
  setStatusBarColor(color);
  /*try {
    await FlutterStatusbarcolor.setStatusBarColor(color, animate: true);
    FlutterStatusbarcolor.setStatusBarWhiteForeground(useWhiteForeground(color));
  } on Exception catch (e) {
    print(e);
  }*/
}