import 'package:flutter/material.dart';
import 'package:online_shop/size_config.dart';

const kPrimaryColor = Color(0xFFFF7643);
const kPrimaryLightCOlor = Color(0xFFFFECDF);
const kPrimaryGradientColor = LinearGradient(
    colors: [Color(0xFFFFA53E), Color(0xFFFF7643)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight);
const kSecondaryColor = Color(0xFF979797);
const kTextColor = Color(0xFF757575);

const kAnimationDuration = Duration(milliseconds: 200);
final headingStyle = TextStyle(
    color: Colors.black,
    fontSize: getPropotionateScreenWidth(30),
    fontWeight: FontWeight.bold);
//form error
final RegExp kemailValidatorRegex =
    RegExp(r"^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+$");
final RegExp kNameValidatorRegex = RegExp(r"^[A-Z][a-zA-Z]+$");
final RegExp kPhoneNumberValidatorRegex = RegExp(
    r"((\+*)((0[ -]*)*|((91 )*))((\d{12})+|(\d{10})+))|\d{5}([- ]*)d{6}");
const String kEmailNullError = "Please enter your email";
const String kInvalidEmailError = "Please enter valid email";
const String kNullPasswordError = "Please enter your password";
const String kShortPasswordError = "Password is too short";
const String kMatchPassError = "Passwords don't match";
const String kNullFirstNameError = "Please enter your first name";
const String kInvalidFirstNameError = "Please enter valid first name";
const String kInvalidLastNameError = "Please enter valid last name";
const String kNullPhoneNumberError = "Please enter your phone number";
const String kInvalidPhoneNumberError = "Please enter valid phone number";
const String kNullAddress = 'Please enter your address';

final otpInputDecoration = InputDecoration(
  contentPadding:
      EdgeInsets.symmetric(vertical: getPropotionateScreenHeight(15)),
  enabledBorder: outlineInputBorder(),
  focusedBorder: outlineInputBorder(),
  border: outlineInputBorder(),
);

OutlineInputBorder outlineInputBorder() {
  return OutlineInputBorder(
      borderRadius: BorderRadius.circular(15),
      borderSide: const BorderSide(color: kTextColor));
}
