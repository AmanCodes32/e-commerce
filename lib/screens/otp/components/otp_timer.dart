import 'package:flutter/material.dart';

import '../../../constants.dart';

class OTPTimer extends StatefulWidget {
  const OTPTimer({
    Key? key,
  }) : super(key: key);

  @override
  State<OTPTimer> createState() => _OTPTimerState();
}

class _OTPTimerState extends State<OTPTimer> {
  bool _resend = false;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("This code will expire in "),
            TweenAnimationBuilder(
              tween: Tween<double>(begin: 30, end: 0),
              duration: const Duration(seconds: 30),
              builder: (BuildContext context, double value, child) {
                return Text(
                  '00:' + value.toStringAsFixed(0),
                  style: const TextStyle(color: kPrimaryColor),
                );
              },
              onEnd: () {
                setState(() {
                  _resend = true;
                });
              },
            )
          ],
        ),
        // if (_resend)
        //   TextButton(
        //     child: const Text("Resend OTP",
        //         style: TextStyle(color: kPrimaryColor)),
        //     onPressed: () {
        //       setState(() {
        //         _resend = false;
        //       });
        //     },
        //   )
      ],
    );
  }
}
