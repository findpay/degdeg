import 'package:degdeg/presentation/screens/authentication/login.dart';
import 'package:degdeg/presentation/screens/authentication/otp_auth.dart';
import 'package:degdeg/presentation/screens/home/home.dart';
import 'package:degdeg/presentation/screens/member.dart';
import 'package:degdeg/presentation/screens/splash/splash.dart';
import 'package:flutter/material.dart';

import 'model/argument_models.dart';

class RouteNames {
  static const String splashScreen = '/splash';
  static const String loginScreen = '/loginScreen';
  static const String otpScreen = '/otpScreen';
  static const String memberScreen = '/memberScreen';
  static const String sampleAccountScreen = '/sampleAccountScreen';
  static const String homeScreen = '/homeScreen';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouteNames.splashScreen:
        return MaterialPageRoute(
            settings: settings, builder: (_) => const SplashScreen());
      case RouteNames.loginScreen:
        return MaterialPageRoute(
            settings: settings, builder: (_) => const LoginScreen());
      case RouteNames.otpScreen:
         final args = settings.arguments as OtpScreenArguments;
        return MaterialPageRoute(
            settings: settings,
            builder: (_) => OtpAuthenticationScreen(
                  mobile: args.mobile,
                  verificationId: args.verificationId,
                  resendToken: args.resendToken,
                ));
      case RouteNames.memberScreen:
        final mobile = settings.arguments as String;
        return MaterialPageRoute(
            settings: settings,
            builder: (_) => MemberScreen(
                  mobile: mobile,
                ));

       case RouteNames.homeScreen:

        return MaterialPageRoute(
            settings: settings,
            builder: (_) =>const HomeScreen(
                 
                ));

      // case RouteNames.dahabScreen:
      //  final invoiceId = settings.arguments as int;
      //   return MaterialPageRoute(
      //       settings: settings, builder: (_) =>  Dahabscreen(invoiceId: invoiceId,));

      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(
              child: Text('No route defined for ${settings.name}'),
            ),
          ),
        );
    }
  }
}
