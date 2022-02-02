import 'package:flutter/material.dart';

import '../../../size_config.dart';

class DiscountBanner extends StatelessWidget {
  const DiscountBanner({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: const Color(0xFF4A3298),
          borderRadius: BorderRadius.circular(20)),
      height: 90,
      padding: EdgeInsets.symmetric(
          horizontal: getPropotionateScreenWidth(20),
          vertical: getPropotionateScreenHeight(18)),
      width: double.infinity,
      margin: EdgeInsets.symmetric(horizontal: getPropotionateScreenWidth(20)),
      child: const Text.rich(
        TextSpan(
            text: "A Summer Special\n",
            style: TextStyle(color: Colors.white),
            children: [
              TextSpan(
                  text: "Cashback 20%",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold))
            ]),
      ),
    );
  }
}
