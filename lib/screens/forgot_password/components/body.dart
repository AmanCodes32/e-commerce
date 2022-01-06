import 'package:flutter/material.dart';
import 'package:online_shop/screens/sign_in/components/sign_in_form.dart';
import 'package:online_shop/size_config.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(
          horizontal: getPropotionateScreenWidth(20),
        ),
        child: Column(
          children: [
            Text(
              "Forgot Password",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: getPropotionateScreenWidth(28),
                  fontWeight: FontWeight.bold),
            ),
            const Text(
                "Please enter your email and we will send\nyou a link to return to your account",
                textAlign: TextAlign.center),
          ],
        ),
      ),
    );
  }
}
