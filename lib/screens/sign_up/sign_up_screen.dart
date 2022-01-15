import 'package:flutter/material.dart';
import 'package:online_shop/size_config.dart';

class SignUpScreen extends StatelessWidget {
  static const routeName = '/sign-up';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sign Up'),
      ),
      body: Body(),
    );
  }
}

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        width: double.infinity,
        child: Column(
          children: [
            Text(
              'Register Account',
              style: TextStyle(
                  color: Colors.black,
                  fontSize: getPropotionateScreenWidth(30),
                  fontWeight: FontWeight.bold),
            )
          ],
        ),
      ),
    );
  }
}
