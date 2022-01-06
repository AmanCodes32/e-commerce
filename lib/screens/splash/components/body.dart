import 'package:flutter/material.dart';
import 'package:online_shop/components/default_button.dart';
import 'package:online_shop/constants.dart';
import 'package:online_shop/screens/sign_in/sign_in_screen.dart';

import 'package:online_shop/screens/splash/components/splash_content.dart';
import 'package:online_shop/size_config.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  int currentPage = 0;
  List<Map<String, String>> splashData = [
    {
      'text': "Welcome to Tokoto, Let's shop!",
      'image': 'assets/images/splash_1.png',
    },
    {
      'text': "We help people connect with store \naround India",
      'image': 'assets/images/splash_2.png',
    },
    {
      'text': "We show the easy way to shop.\nJust stay at home with us",
      'image': 'assets/images/splash_3.png',
    },
  ];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        width: double.infinity,
        child: Column(
          children: [
            Expanded(
                flex: 4,
                child: PageView.builder(
                  onPageChanged: (value) {
                    setState(() {
                      currentPage = value;
                    });
                  },
                  itemBuilder: (context, index) => SplashContent(
                    text: splashData[index]['text'].toString(),
                    image: splashData[index]['image'].toString(),
                  ),
                  itemCount: splashData.length,
                )),
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: getPropotionateScreenWidth(20)),
                child: Column(
                  children: [
                    const Spacer(),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: List.generate(splashData.length,
                            (index) => buildDot(index: index))),
                    const Spacer(flex: 3),
                    DefaultButton(
                      onPressed: () {
                        Navigator.of(context).pushNamed(SignInScreen.routeName);
                      },
                      text: 'Continue',
                    )
                  ],
                ),
              ),
              flex: 2,
            ),
            const Spacer()
          ],
        ),
      ),
    );
  }

  AnimatedContainer buildDot({required int index}) {
    return AnimatedContainer(
      duration: kAnimationDuration,
      margin: const EdgeInsets.only(right: 5),
      height: 6,
      width: currentPage == index ? 20 : 6,
      decoration: BoxDecoration(
          color: currentPage == index ? kPrimaryColor : const Color(0xFF8D8D8D),
          borderRadius: BorderRadius.circular(3)),
    );
  }
}
