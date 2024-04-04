import 'package:degdeg/constants/images.dart';
import 'package:degdeg/logic/cubit/home_cubit.dart';
import 'package:degdeg/logic/utility/utilities.dart';
import 'package:degdeg/presentation/widgets/custom_image.dart';
import 'package:degdeg/presentation/widgets/home/bottom_sheet.dart';
import 'package:degdeg/presentation/widgets/home/exchange_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  changeAccount(int accountType) {
    final homeCubit = context.read<HomeCubit>();

    if (homeCubit.firstSelectedAccount != null &&
        homeCubit.secondSelectedAccount != null) {
      final accountList = homeCubit.accountLists;
      final selectedAccount = accountType == 1
          ? homeCubit.secondSelectedAccount
          : homeCubit.firstSelectedAccount;

      final accounts = accountList
          .where((element) => element.id != selectedAccount!.id)
          .toList();
      Utility.showBottomSheet(context,
          topupDialog(context, paymentList: accounts, type: accountType));
    }
  }

  @override
  Widget build(BuildContext context) {
    final homeCubit = context.read<HomeCubit>();
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment
                .stretch, // Ensure widgets stretch horizontally
            children: [
              const Padding(
                padding:
                    EdgeInsets.symmetric(vertical: 8.0), // Add vertical padding
                child: Row(
                  children: [
                    CustomImage(path: DefaultImages.avatar),
                  ],
                ),
              ),
              BlocBuilder<HomeCubit, HomeState>(
                builder: (context, state) {
                  if (state is HomeLoadedState) {
                    return Column(
                      children: [
                        ExchangeWidget(
                          label: 'You Send',
                          paymentList: homeCubit.firstSelectedAccount,
                          onTab: () => changeAccount(1),
                          isField: true,
                        ),
                        const SizedBox(height: 16,),
                        ExchangeWidget(
                          label: 'You Send',
                          paymentList: homeCubit.secondSelectedAccount,
                          onTab: () => changeAccount(2),
                        ),
                      ],
                    );
                  }
                  return Container();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
