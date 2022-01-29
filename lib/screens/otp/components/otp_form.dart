import 'package:flutter/material.dart';
import 'package:online_shop/components/default_button.dart';

import '../../../constants.dart';
import '../../../size_config.dart';

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
