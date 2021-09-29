import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class AddressSearchPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'categories_title'.tr(),
        ),
      ),
      body: Center(
        child: Text("Search address here"),
      ),
    );
  }
}
