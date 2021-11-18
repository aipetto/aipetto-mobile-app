import 'package:aipetto/modules/auth/bloc/authentication_bloc.dart';
import 'package:aipetto/routes/routes.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AccountWidget extends StatelessWidget {
  final Color color;

  const AccountWidget({
    Key key,
    @required this.color,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final authBloc = BlocProvider.of<AuthenticationBloc>(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        InkWell(
          onTap: () {
            Navigator.of(context).pushNamed(Routes.appSettings);
            //this.onTap();
          },
          child: Container(
            width: double.infinity,
            height: 30,
            child: Row(
              children: <Widget>[
                SizedBox(
                  width: 10,
                ),
                Text(
                  'accounts'.tr(),
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                  ),
                )
              ],
            ),
          ),
        ),
        ListTile(
          leading: Text(
            'logout'.tr(),
            style: TextStyle(
              color: Colors.blue,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          trailing: Icon(
            Icons.exit_to_app,
            color: Colors.blue,
          ),
          onTap: () {
            authBloc.add(UserLoggedOut());
            Navigator.of(context).pushNamed(Routes.onboarding);
          },
        ),
      ],
    );
  }
}
