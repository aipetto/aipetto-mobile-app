import 'package:aipetto/components/custom_button.dart';
import 'package:aipetto/components/labeled_text_form_field.dart';
import 'package:aipetto/routes/routes.dart';
import 'package:aipetto/utils/constants.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

enum Sex { male, female }

class InputWidget extends StatefulWidget {
  @override
  _InputWidgetState createState() => _InputWidgetState();
}

class _InputWidgetState extends State<InputWidget> {
  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  Sex _sex = Sex.male;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 38),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              LabeledTextFormField(
                title: 'first_name_dot'.tr(),
                controller: _firstNameController,
                hintText: 'John',
              ),
              LabeledTextFormField(
                title: 'last_name_dot'.tr(),
                controller: _lastNameController,
                hintText: 'Doe',
              ),
              Text(
                'sex_dot'.tr(),
                style: kInputTextStyle,
              ),
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            children: <Widget>[
              Radio(
                value: Sex.male,
                groupValue: _sex,
                onChanged: (sex) {
                  setState(() {
                    _sex = sex;
                  });
                },
              ),
              Text(
                'male'.tr(),
                style: kInputTextStyle,
              ),
              SizedBox(
                width: 30,
              ),
              Radio(
                value: Sex.female,
                groupValue: _sex,
                onChanged: (sex) {
                  setState(() {
                    _sex = sex;
                  });
                },
              ),
              Text(
                'female'.tr(),
                style: kInputTextStyle,
              ),
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 38),
          child: Column(
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
              ),
              LabeledTextFormField(
                title: 'confirm_password_dot'.tr(),
                controller: _confirmPasswordController,
                obscureText: true,
                hintText: '* * * * * *',
              ),
            ],
          ),
        ),
        CustomButton(
          onPressed: () => Navigator.of(context)
              .popUntil(ModalRoute.withName(Routes.petProfile)),

          /// TODO pass for pet details page or back to home
          text: 'sign_up'.tr(),
        ),
      ],
    );
  }
}
