import 'package:degdeg/data/router.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pinput/pinput.dart';

import '../../theme.dart';
import '../../widgets/custom_button.dart';

class OtpAuthenticationScreen extends StatefulWidget {
  final String mobile;
  final String verificationId ;
  final int? resendToken;
  const OtpAuthenticationScreen({super.key, required this.mobile, required this.verificationId, required this.resendToken});

  @override
  State<OtpAuthenticationScreen> createState() =>
      _OtpAuthenticationScreenState();
}

class _OtpAuthenticationScreenState extends State<OtpAuthenticationScreen> {
  final defaultPinTheme = PinTheme(
    width: 56,
    height: 56,
    textStyle: TextStyle(
        fontSize: 32,
        color: AppTheme.isLightTheme == false
            ? Colors.white
            : const Color(0xff15141F),
        fontWeight: FontWeight.w800),
    decoration: BoxDecoration(
      color: AppTheme.isLightTheme == false
          ? const Color(0xff211F32)
          : const Color(0xffF9F9FA),
      //border: Border.all(color: Color.fromRGBO(234, 239, 243, 1)),
      borderRadius: BorderRadius.circular(16),
    ),
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: WillPopScope(
        onWillPop: () async {
          SystemNavigator.pop();
          return false;
        },
        child: InkWell(
          focusColor: Colors.transparent,
          highlightColor: Colors.transparent,
          hoverColor: Colors.transparent,
          splashColor: Colors.transparent,
          onTap: () {
            FocusScope.of(context).requestFocus(FocusNode());
          },
          child: Container(
            color: AppTheme.isLightTheme == false
                ? const Color(0xff15141F)
                : const Color(0xffFFFFFF),
            child: Padding(
              padding: EdgeInsets.only(
                left: 20,
                right: 20,
                top: AppBar().preferredSize.height,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  InkWell(
                      focusColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      splashColor: Colors.transparent,
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: const Icon(Icons.arrow_back)),
                  const Spacer(),
                  Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          "OTP Authentication",
                          style:
                              Theme.of(context).textTheme.headline6!.copyWith(
                                    fontWeight: FontWeight.w800,
                                    fontSize: 24,
                                  ),
                        ),
                        const SizedBox(
                          height: 4,
                        ),
                        Text(
                          "An authentication code has been sent to",
                          style:
                              Theme.of(context).textTheme.bodyText2!.copyWith(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 16,
                                    color: const Color(0xffA2A0A8),
                                  ),
                        ),
                        const SizedBox(
                          height: 4,
                        ),
                        Text(
                          widget.mobile,
                          style:
                              Theme.of(context).textTheme.bodyText2!.copyWith(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 16,
                                  ),
                        ),
                        const SizedBox(
                          height: 32,
                        ),
                        Pinput(
                          defaultPinTheme: defaultPinTheme,
                          length: 6,
                        ),
                        const SizedBox(
                          height: 32,
                        ),
                        customButton(
                            onTap: () {
                              Navigator.pushNamed(
                                  context, RouteNames.memberScreen,
                                  arguments: widget.mobile);
                            },
                            bgClr: HexColor(AppTheme.primaryColorString!),
                            text: "Continue",
                            txtClr: HexColor(AppTheme.secondaryColorString!),
                            context: context),
                      ],
                    ),
                  ),
                  const Spacer(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
