import 'package:degdeg/logic/cubit/member_cubit.dart';
import 'package:degdeg/logic/utility/utilities.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../constants/images.dart';
import '../theme.dart';
import '../widgets/custom_button.dart';
import '../widgets/custom_image.dart';
import '../widgets/custom_textformfield.dart';

class MemberScreen extends StatefulWidget {
  final String mobile;
  const MemberScreen({super.key, required this.mobile});

  @override
  State<MemberScreen> createState() => _MemberScreenState();
}

class _MemberScreenState extends State<MemberScreen> {
  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocListener<NewMemberCubit, NewMemberState>(
        listener: (context, state) {
          if (state is NewMemberLoadingState) {
            Utility.loadingDialog(context);
          }
          if (state is NewMembeErrorState) {
            Navigator.pop(context);
            Utility.errorDialog(context: context, message: state.message);
          }
          if (state is NewMemberLoadedState) {
            Navigator.pop(context);
          }
        },
        child: Scaffold(
          body: Container(
            color: AppTheme.isLightTheme == false
                ? const Color(0xff15141F)
                : const Color(0xffFFFFFF),
            padding: EdgeInsets.only(
              left: 20,
              right: 20,
              top: AppBar().preferredSize.height,
            ),
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
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
                    "Sign up account",
                    style: Theme.of(context).textTheme.bodyText2!.copyWith(
                          fontWeight: FontWeight.w500,
                          fontSize: 16,
                          color: const Color(0xffA2A0A8),
                        ),
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  CustomTextFormField(
                    readOnly: true,
                    hintText: ' First name',
                    inputType: TextInputType.name,
                    textEditingController: firstNameController,
                    capitalization: TextCapitalization.none,
                    limit: [
                      LengthLimitingTextInputFormatter(10),
                      FilteringTextInputFormatter.singleLineFormatter
                    ],
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  CustomTextFormField(
                    hintText: ' Last name',
                    inputType: TextInputType.name,
                    textEditingController: lastNameController,
                    capitalization: TextCapitalization.none,
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  customButton(
                    onTap: () {
                      var body = {
                        "phone": widget.mobile,
                        "first_name": firstNameController.text,
                        "last_name": lastNameController.text,
                      };
              
                      context.read<NewMemberCubit>().addNewMember(body);
                    },
                    text: "Sign Up",
                    context: context,
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
