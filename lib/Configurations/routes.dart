

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:smart_city/Configurations/page_route_name.dart';
import 'package:smart_city/pages/Auth/ForgotPassword/forgot_password_view.dart';
import 'package:smart_city/pages/Auth/OTP/otp_view.dart';
import 'package:smart_city/pages/Auth/login/login_view.dart';
import 'package:smart_city/pages/Auth/register/register_view.dart';
import 'package:smart_city/pages/Main/main_view.dart';
import 'package:smart_city/pages/Splash/splash_view.dart';

class Routes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case PageRouteName.initial:
        return MaterialPageRoute<dynamic>(
            builder: (_) => const Splash(), settings: settings);

      case PageRouteName.login:
        return MaterialPageRoute<dynamic>(
            builder: (_) => const Login(), settings: settings);

      case PageRouteName.register:
        return MaterialPageRoute<dynamic>(
            builder: (_) => const Register(), settings: settings);

      case PageRouteName.forgotPassword:
        return MaterialPageRoute<dynamic>(
            builder: (_) => const ForgotPassword(), settings: settings);

      case PageRouteName.otp:
        return MaterialPageRoute<dynamic>(
            builder: (_) => const Otp(), settings: settings);
      case PageRouteName.main:
        return MaterialPageRoute<dynamic>(
            builder: (_) =>  MainView(), settings: settings);


      default:
        return MaterialPageRoute<dynamic>(
            builder: (_) => const Splash(), settings: settings);
    }
  }




}