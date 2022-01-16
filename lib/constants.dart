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
