import 'package:flutter/material.dart';
import 'package:online_shop/screens/forgot_password/components/forgot_password_form.dart';
import 'package:online_shop/size_config.dart';

import '../../../constants.dart';
import '../../../components/no_account_text.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(
          horizontal: getPropotionateScreenWidth(20),
        ),
        child: Column(
          children: [
            SizedBox(height: SizeConfig.screenHeight! * 0.04),
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
            SizedBox(height: SizeConfig.screenHeight! * 0.04),
            SizedBox(height: SizeConfig.screenHeight! * 0.04),
            ForgotPasswordForm(),
            SizedBox(height: SizeConfig.screenHeight! * 0.04),
            const NoAccountText(),
          ],
        ),
      ),
    );
  }
}
