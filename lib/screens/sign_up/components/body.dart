import 'package:flutter/material.dart';
import 'package:online_shop/components/social_card.dart';
import 'package:online_shop/constants.dart';
import 'package:online_shop/screens/sign_up/components/sign_up_form.dart';

import '../../../size_config.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding:
            EdgeInsets.symmetric(horizontal: getPropotionateScreenWidth(20)),
        width: double.infinity,
        child: Column(
          children: [
            SizedBox(height: SizeConfig.screenHeight! * 0.04),
            Text(
              'Register Account',
              style: headingStyle,
            ),
            Text(
              'Complete your details or continue \nwith social media.',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: getPropotionateScreenWidth(15)),
            ),
            SizedBox(height: SizeConfig.screenHeight! * 0.04),
            const SignUpForm(),
            SizedBox(height: SizeConfig.screenHeight! * 0.04),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SocialCard(
                    icon: 'assets/icons/google-icon.svg', onPressed: () {}),
                SocialCard(
                    icon: 'assets/icons/facebook-2.svg', onPressed: () {}),
                SocialCard(icon: 'assets/icons/twitter.svg', onPressed: () {})
              ],
            ),
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
