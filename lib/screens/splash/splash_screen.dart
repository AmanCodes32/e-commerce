import 'package:flutter/material.dart';
import 'package:online_shop/screens/splash/components/body.dart';
import 'package:online_shop/size_config.dart';

class SplashScreen extends StatelessWidget {
  static const routeName = '/splash-screen';
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: Body(),
    );
  }
}
