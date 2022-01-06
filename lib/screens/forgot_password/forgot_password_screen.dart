import 'package:flutter/material.dart';
import 'package:online_shop/screens/forgot_password/components/body.dart';

class ForgotPasswordScreen extends StatelessWidget {
  static const routeName = '/forgot-password';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Forgot Password"),
      ),
      body: Body(),
    );
  }
}
