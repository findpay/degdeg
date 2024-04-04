import 'package:degdeg/constants/images.dart';
import 'package:degdeg/logic/cubit/home_cubit.dart';
import 'package:degdeg/logic/utility/utilities.dart';
import 'package:degdeg/presentation/widgets/custom_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/model/member_accounts.dart';

class ExchangeWidget extends StatelessWidget {
  final String label;
  final PaymentList? paymentList;
  final VoidCallback onTab;
  final bool isField;
  const ExchangeWidget(
      {super.key,
      required this.label,
      required this.paymentList,
      required this.onTab,
      this.isField = false});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme.bodyText2!.copyWith(
          fontWeight: FontWeight.w500,
          fontSize: 12,
        );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: theme.copyWith(fontSize: 16, fontWeight: FontWeight.w500),
        ),
        Container(
          width: Utility.getScreenWidth(context),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            border: Border.all(width: 1, color: Colors.grey),
          ),
          child: Center(
            child: ListTile(
              titleAlignment: ListTileTitleAlignment.center,
              minVerticalPadding: 0,
              leading: const CustomImage(
                path: DefaultImages.appLogo1,
                width: 30,
                height: 30,
              ),
              title: Row(
                children: [
                  GestureDetector(
                    onTap: onTab,
  
                     
                      child: Row(
                        children: [
                          Text(
                            paymentList != null
                                ? paymentList!.name
                                : 'select account',
                            style: theme.copyWith(fontWeight: FontWeight.w700),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          const Icon(
                            Icons.keyboard_arrow_down_sharp,
                            size: 20,
                          ),
                        ],
                      ),
                    
                  ),   
                ],
              ),
              trailing: !isField
                  ? Text(
                      context.watch<HomeCubit>().amount.toString(),
                      style: theme.copyWith(fontWeight: FontWeight.w700),
                    )
                  : SizedBox(
                      width: 50,
                      child: TextField(
                        textAlign: TextAlign.end,
                        style: theme.copyWith(fontWeight: FontWeight.w700),
                        keyboardType: TextInputType.number,
                        onChanged: (String amount) {
                          context
                              .read<HomeCubit>()
                              .onAmountChange(double.parse(amount));
                        },
                        decoration: const InputDecoration(
                          hintText: 'lacagta',
                          border: InputBorder.none,
                          
                        ),
                      ),
                    ),
            ),
          ),
        ),
      ],
    );
  }
}
