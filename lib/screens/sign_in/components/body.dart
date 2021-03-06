import 'package:flutter/material.dart';
import 'package:online_shop/components/no_account_text.dart';
import 'package:online_shop/components/social_card.dart';
import 'package:online_shop/constants.dart';
import 'package:online_shop/screens/sign_in/components/sign_in_form.dart';
import 'package:online_shop/size_config.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        width: double.infinity,
        padding:
            EdgeInsets.symmetric(horizontal: getPropotionateScreenWidth(20)),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: SizeConfig.screenHeight! * 0.04),
              Text("Welcome Back", style: headingStyle),
              const Text(
                "Sign in with your email and password\nor continue with social media",
                textAlign: TextAlign.center,
              ),
              SizedBox(height: SizeConfig.screenHeight! * 0.04),
              SignInForm(),
              SizedBox(height: SizeConfig.screenHeight! * 0.04),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SocialCard(
                    icon: 'assets/icons/google-icon.svg',
                    onPressed: () {},
                  ),
                  SocialCard(
                    icon: 'assets/icons/facebook-2.svg',
                    onPressed: () {},
                  ),
                  SocialCard(
                    icon: 'assets/icons/twitter.svg',
                    onPressed: () {},
                  ),
                ],
              ),
              SizedBox(
                height: getPropotionateScreenHeight(20),
              ),
              NoAccountText()
            ],
          ),
        ),
      ),
    );
  }
}
