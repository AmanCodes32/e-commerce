import 'package:flutter/material.dart';
import '../sign_in/components/body.dart';

class SignInScreen extends StatelessWidget {
  static const routeName = '/sign-in';

  const SignInScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Sign In",
        ),
      ),
      body: Body(),
    );
  }
}
