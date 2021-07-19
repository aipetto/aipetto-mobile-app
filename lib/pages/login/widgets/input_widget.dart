import 'package:aipetto/components/custom_button.dart';
import 'package:aipetto/services/auth_service.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../../components/labeled_text_form_field.dart';
import '../../../routes/routes.dart';

class InputWidget extends StatefulWidget {
  @override
  _InputWidgetState createState() => _InputWidgetState();
}

class _InputWidgetState extends State<InputWidget> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        LabeledTextFormField(
          title: 'email_dot'.tr(),
          controller: _emailController,
          keyboardType: TextInputType.emailAddress,
          hintText: 'email@email.com',
        ),
        LabeledTextFormField(
          title: 'password_dot'.tr(),
          controller: _passwordController,
          obscureText: true,
          hintText: '* * * * * *',
          padding: 0,
        ),
        SizedBox(
          height: 20,
        ),
        CustomButton(
          onPressed: () {
            print(_emailController.text);
            print(_passwordController.text);

            // final authService = Provider.of<AuthService>(context, listen: false);
            // authService.login(_emailController, _passwordController);

             Navigator.of(context)
                .popAndPushNamed(Routes.home);
          },
          text: 'login'.tr(),
        ),
        Row(
          children: [
            Expanded(
              child: Container(),
            ),
            FlatButton(
              onPressed: () {
                Navigator.of(context).pushNamed(Routes.forgotPassword);
              },
              child: Text(
                'forgot_yout_password'.tr(),
                style:
                    Theme.of(context).textTheme.button.copyWith(fontSize: 14),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
