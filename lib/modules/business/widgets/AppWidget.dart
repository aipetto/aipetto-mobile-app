import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

void changeStatusColor(Color color) async {
  setStatusBarColor(color);
  /*try {
    await FlutterStatusbarcolor.setStatusBarColor(color, animate: true);
    FlutterStatusbarcolor.setStatusBarWhiteForeground(useWhiteForeground(color));
  } on Exception catch (e) {
    print(e);
  }*/
}
