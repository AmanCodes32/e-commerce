import 'package:flutter/material.dart';

const kPrimaryColor = Color(0xFFFF7643);
const kPrimaryLightCOlor = Color(0xFFFFECDF);
const kPrimaryGradientColor = LinearGradient(
    colors: [Color(0xFFFFA53E), Color(0xFFFF7643)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight);
const kSecondaryColor = Color(0xFF979797);
const kTextColor = Color(0xFF757575);

const kAnimationDuration = Duration(milliseconds: 200);

//form error
final RegExp kemailValidatorRegex =
    RegExp(r"^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+$");
const String kEmailNullError = "Please enter your email";
const String kInvalidEmailError = "Please enter valid email";
const String kNullPasswordError = "Please enter your password";
const String kShortPasswordError = "Password is too short";
const String kMatchPassError = "Passwords don't match";
