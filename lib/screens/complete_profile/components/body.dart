import 'package:flutter/material.dart';
import 'package:online_shop/constants.dart';

import '../../../size_config.dart';
import 'complete_profile_form.dart';

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
              style: headingStyle,
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
