// ignore_for_file: avoid_function_literals_in_foreach_calls, library_private_types_in_public_api
import 'package:degdeg/data/model/argument_models.dart';
import 'package:degdeg/data/router.dart';
import 'package:degdeg/logic/cubit/authenticate_cubit.dart';
import 'package:degdeg/logic/utility/utilities.dart';
import 'package:degdeg/presentation/widgets/custom_image.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../../constants/images.dart';
import '../../theme.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/custom_textformfield.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final mobileController = TextEditingController();
  final List<FocusNode> _focusNodes = [
    FocusNode(),
  ];
  @override
  void initState() {
    super.initState();
  }

  _submitForm() {
    final mobile = mobileController.text.trim();
    if (mobile.isEmpty) {
      return Utility.showSnackBar(context, 'Please enter mobile number');
    }
    if (mobile.length < 10) {
      return Utility.showSnackBar(context, 'Please enter proper number');
    }

    // context.read<AuthenticateCubit>().verifyPhoneNumber(mobile);

     Navigator.pushNamed(context, RouteNames.otpScreen,arguments: OtpScreenArguments(mobile: '45454545',
      verificationId: '43343434', resendToken: 0) );

  }

  @override
  Widget build(BuildContext homeContext) {
    return BlocListener<AuthenticateCubit,AuthenticateState>(
      listener:(context, state) {
        if (state is AuthenticateStateLoading) {
          Utility.loadingDialog(context);
        }
        if (state is AuthenticateStateError) {
          Utility.closeDialog(context);
          Utility.errorDialog(context: context,message: state.error);
        }
        if (state is AuthenticateStateCodeSent) {
          Utility.closeDialog(context);
          Navigator.pushNamed(context, RouteNames.homeScreen);
        }

        if (state is AuthenticateStateVerificationCompleted) {
          Utility.closeDialog(context);
        }
        


      },
      child: Scaffold(
        body: InkWell(
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
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // const Icon(Icons.arrow_back),
                  const SizedBox(
                    height: 38,
                  ),
                  const CustomImage(
                    path: DefaultImages.appLogo1,
                    height: 150,
                    width: 200,
                  ),
                  const SizedBox(
                    height: 4,
                  ),
                  Text(
                    "Sign in to your account",
                    style: Theme.of(context).textTheme.bodyText2!.copyWith(
                          fontWeight: FontWeight.w500,
                          fontSize: 16,
                          color: const Color(0xffA2A0A8),
                        ),
                  ),
                  ListView(
                    physics: const ClampingScrollPhysics(),
                    shrinkWrap: true,
                    children: [
                      Column(
                        children: [
                          CustomTextFormField(
                            focusNode: _focusNodes[0],
                            prefix: Padding(
                              padding: const EdgeInsets.all(14.0),
                              child: SvgPicture.asset(
                                DefaultImages.phone,
                                color: _focusNodes[0].hasFocus
                                    ? HexColor(AppTheme.primaryColorString!)
                                    : const Color(0xffA2A0A8),
                                // color:  HexColor(AppTheme.secondaryColorString!)
                              ),
                            ),
                            hintText: "Phone Number",
                            inputType: TextInputType.phone,
                            textEditingController: mobileController,
                            capitalization: TextCapitalization.none,
                            limit: [
                              LengthLimitingTextInputFormatter(13),
                              FilteringTextInputFormatter.digitsOnly
                            ],
                          ),
                          const SizedBox(height: 24),
                          Builder(
                            builder: (context) {
                              // final loginState =
                              //     homeContext.watch<LoginCubit>().state;
                              return customButton(
                                onTap: _submitForm,
                                text: "Login",
                                context: context,
                                // child: (loginState is LoginStateLoading)
                                //     ? const Center(
                                //         child: CircularProgressIndicator(
                                //             color: Colors.white),
                                //       )
                                //     : null,
                              );
                            },
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
