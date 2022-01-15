import 'package:flutter/material.dart';
import 'package:online_shop/components/custom_suffix_icon.dart';
import 'package:online_shop/components/default_button.dart';
import 'package:online_shop/components/form_error.dart';
import 'package:online_shop/constants.dart';
import 'package:online_shop/size_config.dart';

class ForgotPasswordForm extends StatefulWidget {
  @override
  _ForgotPasswordFormState createState() => _ForgotPasswordFormState();
}

class _ForgotPasswordFormState extends State<ForgotPasswordForm> {
  final _formKey = GlobalKey<FormState>();
  final List<String> errors = [];
  String email = '';
  @override
  Widget build(BuildContext context) {
    return Form(
        key: _formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            buildEmailTextFormField(),
            SizedBox(height: getPropotionateScreenHeight(30)),
            FormError(errors: errors),
            SizedBox(height: getPropotionateScreenHeight(30)),
            DefaultButton(
                text: "Continue",
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    //send an email
                  }
                })
          ],
        ));
  }

  TextFormField buildEmailTextFormField() {
    return TextFormField(
      onSaved: (newValue) => email = newValue!,
      onChanged: (value) {
        if (value.isNotEmpty && errors.contains(kEmailNullError)) {
          setState(() {
            errors.remove(kEmailNullError);
          });
        } else if (value.isEmpty ||
            kemailValidatorRegex.hasMatch(value) &&
                errors.contains(kInvalidEmailError)) {
          setState(() {
            errors.remove(kInvalidEmailError);
          });
        }
      },
      validator: (value) {
        if (value!.isEmpty && !errors.contains(kEmailNullError)) {
          setState(() {
            errors.add(kEmailNullError);
          });
        } else if (!kemailValidatorRegex.hasMatch(value) &&
            !errors.contains(kInvalidEmailError)) {
          setState(() {
            errors.add(kInvalidEmailError);
          });
        }
        return null;
      },
      decoration: const InputDecoration(
          label: Text('Email'),
          hintText: 'Enter your email',
          suffixIcon: CustomSuffixIcon(svgIcon: "assets/icons/Mail.svg"),
          floatingLabelBehavior: FloatingLabelBehavior.always),
      keyboardType: TextInputType.emailAddress,
    );
  }
}
