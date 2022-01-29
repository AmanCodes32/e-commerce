import 'package:flutter/material.dart';
import 'package:online_shop/screens/home/components/search_file.dart';

import '../../../size_config.dart';
import 'icon_btn_with_counter.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: getPropotionateScreenWidth(20)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          const SearchField(),
          IconBtnWithCounter(
            press: () {},
            svgSrc: "assets/icons/Cart Icon.svg",
          ),
          IconBtnWithCounter(
            press: () {},
            svgSrc: "assets/icons/Bell.svg",
            numberOfItem: 3,
          ),
        ],
      ),
    );
  }
}
