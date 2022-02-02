import 'package:flutter/material.dart';
import 'package:online_shop/screens/home/components/special_offers.dart';
import 'package:online_shop/size_config.dart';
import 'category.dart';
import 'discount_banner.dart';
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
          const HomeHeader(),
          SizedBox(height: getPropotionateScreenHeight(30)),
          const DiscountBanner(),
          SizedBox(height: getPropotionateScreenHeight(30)),
          Category(),
          SizedBox(height: getPropotionateScreenHeight(30)),
          SectionTitle(
            text: "Special for you",
            press: () {},
          ),
          SizedBox(height: getPropotionateScreenHeight(30)),
          SpecialOffers()
        ],
      ),
    ));
  }
}
