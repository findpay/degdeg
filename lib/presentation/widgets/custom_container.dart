import 'package:flutter/material.dart';

import '../theme.dart';

class CustomButton extends StatelessWidget {
  final BuildContext context;
  final String? title;
  final VoidCallback? onTap;
  const CustomButton(
      {super.key, this.title, this.onTap, required this.context});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return InkWell(
      onTap: () {
        onTap!();
      },
      child: Container(
        height: 56,
        width: screenWidth,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: HexColor(AppTheme.primaryColorString!),
        ),
        child: Center(
          child: Text(
            title!,
            style: Theme.of(context).textTheme.headline6!.copyWith(
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                  color: Colors.white,
                ),
          ),
        ),
      ),
    );
  }
}
