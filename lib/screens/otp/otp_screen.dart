import 'dart:async';

import 'package:flutter/material.dart';
import 'package:online_shop/components/default_button.dart';
import 'package:online_shop/constants.dart';
import 'package:online_shop/size_config.dart';

class OtpScreen extends StatelessWidget {
  static const routeName = "/otp-screen";

  const OtpScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('OTP Verification'),
      ),
      body: const Body(),
    );
  }
}

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final String phoneNumber =
        ModalRoute.of(context)!.settings.arguments as String;
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: getPropotionateScreenWidth(20)),
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: SizeConfig.screenHeight! * 0.05),
            Text("OTP Verification", style: headingStyle),
            Text(
                'We sent you code at +91 ${phoneNumber.substring(0, 4)} *** ***'),
            const OTPTimer(),
            SizedBox(height: SizeConfig.screenHeight! * 0.15),
            const OTPForm(),
            SizedBox(height: SizeConfig.screenHeight! * 0.15),
            const Text(
              "Resend OTP code",
              style: TextStyle(decoration: TextDecoration.underline),
            )
          ],
        ),
      ),
    );
  }
}

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
        if (_resend)
          TextButton(
            child: const Text("Resend OTP",
                style: TextStyle(color: kPrimaryColor)),
            onPressed: () {
              setState(() {
                _resend = false;
              });
            },
          )
      ],
    );
  }
}

class OTPForm extends StatefulWidget {
  const OTPForm({Key? key}) : super(key: key);

  @override
  _OTPFormState createState() => _OTPFormState();
}

class _OTPFormState extends State<OTPForm> {
  final _formKey = GlobalKey<FormState>();
  FocusNode pin2FocusNode = FocusNode();
  FocusNode pin3FocusNode = FocusNode();
  FocusNode pin4FocusNode = FocusNode();

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    pin2FocusNode.dispose();
    pin3FocusNode.dispose();
    pin4FocusNode.dispose();
  }

  void nextValue(String value, FocusNode focusNode) {
    if (value.length == 1) {
      focusNode.requestFocus();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SizedBox(
                  width: getPropotionateScreenWidth(60),
                  child: TextFormField(
                    autofocus: true,
                    onChanged: (value) {
                      nextValue(value, pin2FocusNode);
                    },
                    textAlign: TextAlign.center,
                    keyboardType: TextInputType.number,
                    decoration: otpInputDecoration,
                    obscureText: true,
                    style: const TextStyle(fontSize: 24),
                  )),
              SizedBox(
                  width: getPropotionateScreenWidth(60),
                  child: TextFormField(
                    focusNode: pin2FocusNode,
                    onChanged: (value) {
                      nextValue(value, pin3FocusNode);
                    },
                    textAlign: TextAlign.center,
                    keyboardType: TextInputType.number,
                    decoration: otpInputDecoration,
                    obscureText: true,
                    style: const TextStyle(fontSize: 24),
                  )),
              SizedBox(
                  width: getPropotionateScreenWidth(60),
                  child: TextFormField(
                    focusNode: pin3FocusNode,
                    onChanged: (value) {
                      nextValue(value, pin4FocusNode);
                    },
                    textAlign: TextAlign.center,
                    keyboardType: TextInputType.number,
                    decoration: otpInputDecoration,
                    obscureText: true,
                    style: const TextStyle(fontSize: 24),
                  )),
              SizedBox(
                  width: getPropotionateScreenWidth(60),
                  child: TextFormField(
                    focusNode: pin4FocusNode,
                    onChanged: (value) {
                      pin4FocusNode.unfocus();
                    },
                    textAlign: TextAlign.center,
                    keyboardType: TextInputType.number,
                    decoration: otpInputDecoration,
                    obscureText: true,
                    style: const TextStyle(fontSize: 24),
                  )),
            ],
          ),
          SizedBox(height: SizeConfig.screenHeight! * 0.15),
          DefaultButton(text: 'Continue', onPressed: () {})
        ],
      ),
    );
  }
}
