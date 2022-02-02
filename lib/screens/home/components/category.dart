import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../size_config.dart';

class Category extends StatelessWidget {
  Category({Key? key}) : super(key: key);

  Map<String, String> categories = {
    "assets/icons/Flash Icon.svg": "Flash Deal",
    "assets/icons/Bill Icon.svg": "Bill",
    "assets/icons/Game Icon.svg": "Game",
    "assets/icons/Gift Icon.svg": "Daily Gift",
    "assets/icons/Discover.svg": "More"
  };

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: getPropotionateScreenWidth(20)),
      height: SizeConfig.screenHeight! * 0.14,
      width: double.infinity,
      child: GridView.builder(
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 1,
          mainAxisExtent: SizeConfig.screenWidth! * 0.15,
          childAspectRatio: 1,
          mainAxisSpacing: 15,
        ),
        itemBuilder: (context, index) {
          List key = categories.keys.toList();
          List values = categories.values.toList();
          return CategoryCard(
              icon: key[index], text: values[index], press: () {});
        },
        itemCount: categories.length,
        scrollDirection: Axis.horizontal,
      ),
    );
  }
}

class CategoryCard extends StatelessWidget {
  const CategoryCard(
      {Key? key, required this.icon, required this.text, required this.press})
      : super(key: key);

  final String icon, text;
  final GestureTapCallback press;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        GestureDetector(
          onTap: press,
          child: Container(
            height: SizeConfig.screenHeight! * 0.08,
            width: SizeConfig.screenWidth! * 0.15,
            padding: EdgeInsets.all(getPropotionateScreenHeight(15)),
            decoration: BoxDecoration(
                color: const Color(0xFFFFECDF),
                borderRadius: BorderRadius.circular(20)),
            child: SvgPicture.asset(icon),
          ),
        ),
        const SizedBox(height: 5),
        SizedBox(
            width: SizeConfig.screenWidth! * 0.1,
            height: SizeConfig.screenHeight! * 0.05,
            child: Text(
              text,
              textAlign: TextAlign.center,
            )),
      ],
    );
  }
}
