import 'package:flutter/widgets.dart';
import 'package:online_shop/screens/forgot_password/forgot_password_screen.dart';
import 'package:online_shop/screens/login_success/login_success_screen.dart';
import 'package:online_shop/screens/sign_in/sign_in_screen.dart';
import 'package:online_shop/screens/sign_up/complete_profile_screen.dart';
import 'package:online_shop/screens/sign_up/sign_up_screen.dart';
import 'package:online_shop/screens/splash/splash_screen.dart';

final Map<String, WidgetBuilder> routes = {
  SplashScreen.routeName: (context) => SplashScreen(),
  SignInScreen.routeName: (context) => const SignInScreen(),
  ForgotPasswordScreen.routeName: (context) => ForgotPasswordScreen(),
  LoginSuccessScreen.routeName: (context) => const LoginSuccessScreen(),
  SignUpScreen.routeName: (context) => const SignUpScreen(),
  CompleteProfileScreen.routeName: (context) => const CompleteProfileScreen(),
};
