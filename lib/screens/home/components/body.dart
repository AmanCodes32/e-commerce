import 'package:flutter/material.dart';
import 'package:online_shop/size_config.dart';
import 'home_header.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(height: getPropotionateScreenHeight(20)),
          const HomeHeader()
        ],
      ),
    ));
  }
}
