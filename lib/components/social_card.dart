import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../size_config.dart';

class SocialCard extends StatelessWidget {
  const SocialCard({
    Key? key,
    required this.icon,
    required this.onPressed,
  }) : super(key: key);
  final String icon;
  final Function onPressed;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onPressed(),
      child: Container(
        padding: EdgeInsets.all(getPropotionateScreenWidth(12)),
        margin:
            EdgeInsets.symmetric(horizontal: getPropotionateScreenWidth(12)),
        height: getPropotionateScreenHeight(44),
        width: getPropotionateScreenWidth(40),
        decoration: const BoxDecoration(
            color: Color(0xFFF5F6F9), shape: BoxShape.circle),
        child: SvgPicture.asset(icon),
      ),
    );
  }
}
