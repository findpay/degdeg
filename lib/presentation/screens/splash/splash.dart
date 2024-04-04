// ignore_for_file: library_private_types_in_public_api
import 'dart:async';
import 'package:degdeg/data/router.dart';
import 'package:degdeg/presentation/widgets/custom_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../constants/images.dart';
import '../../theme.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    init();
    super.initState();
  }

  void init() async {
    Timer(const Duration(seconds: 3), () {
      Navigator.pushReplacementNamed(context, RouteNames.loginScreen);
    });
  }

  @override
  Widget build(BuildContext context) {
        double screenWidth = MediaQuery.of(context).size.width;
        double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Container(
        height: screenHeight,
        width: screenWidth,
        decoration: BoxDecoration(
            color: AppTheme.isLightTheme == false
                ? HexColor('#15141F')
                : HexColor(AppTheme.primaryColorString!)),
        child: Column(
          children: [
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 40,
                  width: 40,
                  child: CustomImage(path: DefaultImages.appLogo1),
                ),
                const SizedBox(width: 8),
                SizedBox(
                  height: 40,
                  width: 130,
                  child: SvgPicture.asset(DefaultImages.text,
                      color: HexColor(AppTheme.secondaryColorString!)),
                ),
              ],
            ),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.only(left: 48, right: 48, bottom: 20),
              child: Text(
                "FinPay is a financial platform to manage your business and money.",
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodyText2!.copyWith(
                      fontWeight: FontWeight.w500,
                      fontSize: 14,
                      color: const Color(0xffDCDBE0),
                    ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
