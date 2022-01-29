import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../constants.dart';
import '../../../size_config.dart';

class IconBtnWithCounter extends StatelessWidget {
  IconBtnWithCounter(
      {Key? key,
      required this.svgSrc,
      this.numberOfItem = 0,
      required this.press})
      : super(key: key);
  final GestureTapCallback press;
  final String svgSrc;
  int numberOfItem;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: press,
      borderRadius: BorderRadius.circular(getPropotionateScreenWidth(20)),
      child: Stack(
        children: [
          Container(
            height: getPropotionateScreenHeight(46),
            width: getPropotionateScreenHeight(46),
            padding: EdgeInsets.all(getPropotionateScreenWidth(12)),
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: kSecondaryColor.withOpacity(0.1)),
            child: SvgPicture.asset(svgSrc),
          ),
          if (numberOfItem != 0)
            Positioned(
              right: 0,
              child: Container(
                height: getPropotionateScreenWidth(12),
                width: getPropotionateScreenWidth(12),
                decoration: const BoxDecoration(
                    color: Colors.red, shape: BoxShape.circle),
                child: Text(
                  "$numberOfItem",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                    height: 1,
                    wordSpacing: getPropotionateScreenWidth(12),
                  ),
                ),
              ),
            )
        ],
      ),
    );
  }
}
