import 'package:flutter/material.dart';
import 'package:online_shop/components/custom_suffix_icon.dart';
import 'package:online_shop/components/default_button.dart';
import 'package:online_shop/components/form_error.dart';
import 'package:online_shop/screens/forgot_password/forgot_password_screen.dart';
import 'package:online_shop/screens/login_success/login_success_screen.dart';

import '../../../constants.dart';
import '../../../size_config.dart';

class SignInForm extends StatefulWidget {
  @override
  State<SignInForm> createState() => _SignInFormState();
}

class _SignInFormState extends State<SignInForm> {
  final _formKey = GlobalKey<FormState>();
  final List<String> errors = [];
  String email = '';
  String password = '';
  bool rememberMe = false;
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          buildEmailTextFormField(),
          SizedBox(height: getPropotionateScreenHeight(30)),
          buildPasswordTextFormField(),
          SizedBox(height: getPropotionateScreenHeight(30)),
          Row(
            children: [
              Checkbox(
                  value: rememberMe,
                  onChanged: (value) {
                    setState(() {
                      rememberMe = value!;
                    });
                  }),
              const Text("Remember me"),
              const Spacer(),
              GestureDetector(
                child: const Text(
                  'Forget password?',
                  style: TextStyle(decoration: TextDecoration.underline),
                ),
                onTap: () => Navigator.of(context)
                    .pushNamed(ForgotPasswordScreen.routeName),
              ),
            ],
          ),
          SizedBox(height: getPropotionateScreenHeight(30)),
          FormError(errors: errors),
          SizedBox(height: getPropotionateScreenHeight(30)),
          DefaultButton(
              text: "Continue",
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  _formKey.currentState!.save();
                  if (errors.isEmpty) {
                    Navigator.of(context)
                        .pushNamed(LoginSuccessScreen.routeName);
                  }
                }
                print(email);
                print(password);
              })
        ],
      ),
    );
  }

  TextFormField buildPasswordTextFormField() {
    return TextFormField(
      onSaved: (newValue) => password = newValue!,
      onChanged: (value) {
        if (value.isNotEmpty && errors.contains(kNullPasswordError)) {
          setState(() {
            errors.remove(kNullPasswordError);
          });
        } else if (value.isEmpty ||
            value.length >= 8 && errors.contains(kShortPasswordError)) {
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
      decoration: const InputDecoration(
          label: Text('Password'),
          hintText: 'Enter your password',
          suffixIcon: CustomSuffixIcon(svgIcon: "assets/icons/Lock.svg"),
          floatingLabelBehavior: FloatingLabelBehavior.always),
      obscureText: true,
    );
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
            !errors.contains(kInvalidEmailError) &&
            !errors.contains(kEmailNullError)) {
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
