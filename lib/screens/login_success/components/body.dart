import 'package:flutter/material.dart';
import 'package:online_shop/components/default_button.dart';
import 'package:online_shop/screens/home/home_screen.dart';

import '../../../size_config.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SizedBox(
        width: double.infinity,
        height: SizeConfig.screenHeight,
        child: Column(
          children: [
            SizedBox(height: SizeConfig.screenHeight! * 0.04),
            Image.asset(
              'assets/images/success.png',
              height: SizeConfig.screenHeight! * 0.4,
            ),
            SizedBox(height: SizeConfig.screenHeight! * 0.08),
            Text(
              'Login Success',
              style: TextStyle(
                fontSize: getPropotionateScreenWidth(30),
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
            const Spacer(),
            SizedBox(
                width: SizeConfig.screenWidth! * 0.6,
                child: DefaultButton(
                    text: 'Back to home',
                    onPressed: () =>
                        Navigator.of(context).pushNamed(HomeScreen.routeName))),
            const Spacer()
          ],
        ),
      ),
    );
  }
}
