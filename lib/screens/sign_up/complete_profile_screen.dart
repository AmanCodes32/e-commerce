import 'package:flutter/material.dart';
import 'package:online_shop/components/custom_suffix_icon.dart';
import 'package:online_shop/components/default_button.dart';
import 'package:online_shop/components/form_error.dart';
import 'package:online_shop/constants.dart';
import 'package:online_shop/size_config.dart';

class CompleteProfileScreen extends StatelessWidget {
  const CompleteProfileScreen({Key? key}) : super(key: key);
  static const routeName = '/complete-profile';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sign Up'),
      ),
      body: const Body(),
    );
  }
}

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: SizeConfig.screenHeight! * 0.04),
            Text(
              'Complete Profile',
              style: TextStyle(
                  fontSize: getPropotionateScreenHeight(28),
                  color: Colors.black,
                  fontWeight: FontWeight.bold),
            ),
            Text(
              'Complete your details or continue\nwith social media.',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: getPropotionateScreenHeight(14)),
            ),
            SizedBox(height: SizeConfig.screenHeight! * 0.04),
            const CompleteProfileForm(),
            SizedBox(height: SizeConfig.screenHeight! * 0.04),
            const Text(
              'By continuing,you confirm that you agree\nwith our Terms and Condition.',
              textAlign: TextAlign.center,
            )
          ],
        ),
      ),
    );
  }
}

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
