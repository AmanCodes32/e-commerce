import 'package:flutter/material.dart';
import 'package:online_shop/components/custom_suffix_icon.dart';
import 'package:online_shop/components/default_button.dart';
import 'package:online_shop/components/form_error.dart';
import 'package:online_shop/screens/otp/otp_screen.dart';

import '../../../constants.dart';
import '../../../size_config.dart';

class CompleteProfileForm extends StatefulWidget {
  const CompleteProfileForm({Key? key}) : super(key: key);

  @override
  _CompleteProfileFormState createState() => _CompleteProfileFormState();
}

class _CompleteProfileFormState extends State<CompleteProfileForm> {
  final _formKey = GlobalKey<FormState>();
  List<String> errors = [];
  String firstName = '';
  String lastName = '';
  String phoneNumber = '';
  String address = '';
  @override
  Widget build(BuildContext context) {
    return Form(
        key: _formKey,
        child: Container(
          padding:
              EdgeInsets.symmetric(horizontal: getPropotionateScreenWidth(20)),
          height: SizeConfig.screenHeight! * 0.55,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              firstNameTextFormField(),
              lastNameTextFormField(),
              phoneNumberTextFormField(),
              addressTextFormField(),
              FormError(errors: errors),
              DefaultButton(
                  text: 'Continue',
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      _formKey.currentState!.save();
                      if (errors.isEmpty) {
                        Navigator.of(context).pushNamed(OtpScreen.routeName,
                            arguments: phoneNumber);
                      }
                    }
                  })
            ],
          ),
        ));
  }

  TextFormField addressTextFormField() {
    return TextFormField(
      decoration: const InputDecoration(
        label: Text('Address'),
        hintText: 'Enter your address',
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon:
            CustomSuffixIcon(svgIcon: 'assets/icons/Location point.svg'),
      ),
      validator: (value) {
        if (value!.isEmpty && !errors.contains(kNullAddress)) {
          setState(() {
            errors.add(kNullAddress);
          });
        }
      },
      onChanged: (value) {
        if (value.isNotEmpty && errors.contains(kNullAddress)) {
          setState(() {
            errors.remove(kNullAddress);
          });
        }
      },
      onSaved: (newValue) => address = newValue!,
    );
  }

  TextFormField phoneNumberTextFormField() {
    return TextFormField(
      decoration: const InputDecoration(
        label: Text('Phone Number'),
        hintText: 'Enter your phone number',
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSuffixIcon(svgIcon: 'assets/icons/Phone.svg'),
      ),
      keyboardType: TextInputType.number,
      validator: (value) {
        if (value!.isEmpty && !errors.contains(kNullPhoneNumberError)) {
          setState(() {
            errors.add(kNullPhoneNumberError);
          });
        } else if (value.isNotEmpty &&
            value.length != 10 &&
            !kPhoneNumberValidatorRegex.hasMatch(value) &&
            !errors.contains(kInvalidPhoneNumberError)) {
          setState(() {
            errors.add(kInvalidPhoneNumberError);
          });
        }
      },
      onChanged: (value) {
        if (value.isNotEmpty && errors.contains(kNullPhoneNumberError)) {
          setState(() {
            errors.remove(kNullPhoneNumberError);
          });
        } else if (value.isEmpty ||
            value.length == 10 &&
                kPhoneNumberValidatorRegex.hasMatch(value) &&
                errors.contains(kInvalidPhoneNumberError)) {
          setState(() {
            errors.remove(kInvalidPhoneNumberError);
          });
        }
      },
      onSaved: (newValue) => phoneNumber = newValue!,
    );
  }

  TextFormField lastNameTextFormField() {
    return TextFormField(
      textCapitalization: TextCapitalization.sentences,
      decoration: const InputDecoration(
        label: Text('Last Name'),
        hintText: 'Enter your last name',
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSuffixIcon(svgIcon: 'assets/icons/User.svg'),
      ),
      validator: (value) {
        if (value!.isNotEmpty &&
            !kNameValidatorRegex.hasMatch(value) &&
            !errors.contains(kInvalidLastNameError)) {
          setState(() {
            errors.add(kInvalidLastNameError);
          });
        }
      },
      onChanged: (value) {
        if (value.isEmpty ||
            kNameValidatorRegex.hasMatch(value) &&
                errors.contains(kInvalidLastNameError)) {
          setState(() {
            errors.remove(kInvalidLastNameError);
          });
        }
      },
      onSaved: (newValue) => lastName = newValue!,
    );
  }

  TextFormField firstNameTextFormField() {
    return TextFormField(
      textCapitalization: TextCapitalization.sentences,
      decoration: const InputDecoration(
        label: Text('First Name'),
        hintText: 'Enter your first name',
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSuffixIcon(svgIcon: 'assets/icons/User.svg'),
      ),
      validator: (value) {
        if (value!.isEmpty && !errors.contains(kNullFirstNameError)) {
          setState(() {
            errors.add(kNullFirstNameError);
          });
        } else if (value.isNotEmpty &&
            !kNameValidatorRegex.hasMatch(value) &&
            !errors.contains(kInvalidFirstNameError)) {
          setState(() {
            errors.add(kInvalidFirstNameError);
          });
        }
      },
      onChanged: (value) {
        if (value.isNotEmpty && errors.contains(kNullFirstNameError)) {
          setState(() {
            errors.remove(kNullFirstNameError);
          });
        } else if (value.isEmpty ||
            kNameValidatorRegex.hasMatch(value) &&
                errors.contains(kInvalidFirstNameError)) {
          setState(() {
            errors.remove(kInvalidFirstNameError);
          });
        }
      },
      onSaved: (newValue) => firstName = newValue!,
    );
  }
}
