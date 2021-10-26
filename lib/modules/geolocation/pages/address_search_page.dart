import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class AddressSearchPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('add_location'.tr(),
            style: Theme.of(context)
                .textTheme
                .subtitle1
                .copyWith(fontWeight: FontWeight.w700, color: Colors.white)),
      ),
      body: Center(
        child: Text("Search address here"),
      ),
    );
  }
}
