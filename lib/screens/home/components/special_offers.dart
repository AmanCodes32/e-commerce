import 'package:flutter/material.dart';

import '../../../size_config.dart';

class SpecialOffers extends StatelessWidget {
  SpecialOffers({Key? key}) : super(key: key);

  List<Map<String, dynamic>> offers = [
    {
      "image": "assets/images/Image Banner 2.png",
      "title": "Smartphones",
      "subtitle": 18
    },
    {
      "image": "assets/images/Image Banner 3.png",
      "title": "Fashion",
      "subtitle": 20
    }
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: getPropotionateScreenWidth(20)),
      height: SizeConfig.screenHeight! * 0.1,
      child: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 1,
            mainAxisExtent: getPropotionateScreenWidth(180),
            mainAxisSpacing: 20),
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return SpecialOfferCard(
            image: offers[index]["image"],
            numberOfBrands: offers[index]["subtitle"],
            title: offers[index]["title"],
            press: () {},
          );
        },
        itemCount: offers.length,
      ),
    );
  }
}

class SpecialOfferCard extends StatelessWidget {
  const SpecialOfferCard(
      {Key? key,
      required this.image,
      required this.numberOfBrands,
      required this.title,
      required this.press})
      : super(key: key);

  final String image, title;
  final int numberOfBrands;
  final GestureTapCallback press;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: SizedBox(
          width: getPropotionateScreenWidth(242),
          height: getPropotionateScreenHeight(100),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Stack(
              children: [
                Image.asset(image, fit: BoxFit.contain),
                Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          const Color(0xFF343434).withOpacity(0.4),
                          const Color(0xFF343434).withOpacity(0.15),
                        ]),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: getPropotionateScreenWidth(15),
                      vertical: getPropotionateScreenHeight(10)),
                  child: Text.rich(
                    TextSpan(
                      text: '$title \n',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: getPropotionateScreenWidth(18)),
                      children: [
                        TextSpan(
                            text: '$numberOfBrands Brands',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: getPropotionateScreenWidth(12))),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          )),
    );
  }
}

class SectionTitle extends StatelessWidget {
  const SectionTitle({Key? key, required this.press, required this.text})
      : super(key: key);
  final String text;
  final GestureTapCallback press;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: getPropotionateScreenWidth(20)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(text, style: const TextStyle(color: Colors.black, fontSize: 20)),
          GestureDetector(onTap: press, child: const Text("See More"))
        ],
      ),
    );
  }
}
