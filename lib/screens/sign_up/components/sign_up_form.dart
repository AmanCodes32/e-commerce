import 'package:flutter/material.dart';
import 'package:online_shop/components/custom_suffix_icon.dart';
import 'package:online_shop/components/default_button.dart';
import 'package:online_shop/components/form_error.dart';

import '../../../constants.dart';
import '../../../size_config.dart';

class SignUpForm extends StatefulWidget {
  const SignUpForm({Key? key}) : super(key: key);

  @override
  _SignUpFormState createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  final _formKey = GlobalKey<FormState>();
  String email = '';
  String password = '';
  List<String> errors = [];

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: SizedBox(
        height: SizeConfig.screenHeight! * 0.45,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            emailTextFormField(),
            passwordTextFormField(),
            confirmPasswordTextFormField(),
            FormError(errors: errors),
            DefaultButton(
                text: ('Continue'),
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();
                  }
                })
          ],
        ),
      ),
    );
  }

  TextFormField emailTextFormField() {
    return TextFormField(
      keyboardType: TextInputType.emailAddress,
      decoration: const InputDecoration(
        hintText: 'Enter your email',
        floatingLabelBehavior: FloatingLabelBehavior.always,
        label: Text('Email'),
        suffixIcon: CustomSuffixIcon(
          svgIcon: 'assets/icons/Mail.svg',
        ),
      ),
      validator: (value) {
        if (value!.isEmpty && !errors.contains(kEmailNullError)) {
          setState(() {
            errors.add(kEmailNullError);
          });
        } else if (value.isNotEmpty &&
            !kemailValidatorRegex.hasMatch(value) &&
            !errors.contains(kInvalidEmailError)) {
          setState(() {
            errors.add(kInvalidEmailError);
          });
        }
      },
      onChanged: (value) {
        if (value.isNotEmpty && errors.contains(kEmailNullError)) {
          setState(() {
            errors.remove(kEmailNullError);
          });
        } else if (kemailValidatorRegex.hasMatch(value) &&
            errors.contains(kInvalidEmailError)) {
          setState(() {
            errors.remove(kInvalidEmailError);
          });
        }
      },
      onSaved: (newValue) => email = newValue!,
    );
  }

  TextFormField passwordTextFormField() {
    return TextFormField(
      decoration: const InputDecoration(
        hintText: 'Enter your password',
        floatingLabelBehavior: FloatingLabelBehavior.always,
        label: Text('Password'),
        suffixIcon: CustomSuffixIcon(
          svgIcon: 'assets/icons/Lock.svg',
        ),
      ),
      onSaved: (newValue) => password = newValue!,
      onChanged: (value) {
        if (value.isNotEmpty && errors.contains(kNullPasswordError)) {
          setState(() {
            errors.remove(kNullPasswordError);
          });
        } else if (value.length >= 8 && errors.contains(kShortPasswordError)) {
          setState(() {
            errors.remove(kShortPasswordError);
          });
        }
      },
      validator: (value) {
        if (value!.isEmpty && !errors.contains(kNullPasswordError)) {
          setState(() {
            errors.add(kNullPasswordError);
          });
        } else if (value.length < 8 &&
            !errors.contains(kShortPasswordError) &&
            !errors.contains(kNullPasswordError)) {
          setState(() {
            errors.add(kShortPasswordError);
          });
        }
      },
      obscureText: true,
    );
  }

  TextFormField confirmPasswordTextFormField() {
    return TextFormField(
      decoration: const InputDecoration(
        hintText: 'Re-enter your password',
        floatingLabelBehavior: FloatingLabelBehavior.always,
        label: Text('Confirm Password'),
        suffixIcon: CustomSuffixIcon(
          svgIcon: 'assets/icons/Lock.svg',
        ),
      ),
      validator: (value) {
        if (value!.isEmpty && !errors.contains(kNullPasswordError)) {
          setState(() {
            errors.add(kNullPasswordError);
          });
        } else if (password.isNotEmpty &&
            value != password &&
            !errors.contains(kMatchPassError)) {
          setState(() {
            errors.add(kMatchPassError);
          });
        }
      },
      onChanged: (value) {
        if (value == password && errors.contains(kMatchPassError)) {
          setState(() {
            errors.remove(kMatchPassError);
          });
        }
      },
      obscureText: true,
    );
  }
}
