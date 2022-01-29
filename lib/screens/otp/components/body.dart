import 'package:flutter/material.dart';

import '../../../constants.dart';
import '../../../size_config.dart';
import 'otp_form.dart';
import 'otp_timer.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final String phoneNumber =
        ModalRoute.of(context)!.settings.arguments as String;
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: getPropotionateScreenWidth(20)),
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: SizeConfig.screenHeight! * 0.05),
            Text("OTP Verification", style: headingStyle),
            Text(
                'We sent you code at +91 ${phoneNumber.substring(0, 4)} *** ***'),
            const OTPTimer(),
            SizedBox(height: SizeConfig.screenHeight! * 0.15),
            const OTPForm(),
            SizedBox(height: SizeConfig.screenHeight! * 0.15),
            GestureDetector(
              onTap: () {
                //resend code
              },
              child: const Text(
                "Resend OTP code",
                style: TextStyle(decoration: TextDecoration.underline),
              ),
            )
          ],
        ),
      ),
    );
  }
}
