import 'package:degdeg/logic/cubit/accounts_cubit.dart';
import 'package:degdeg/logic/cubit/save_accounts_cubit.dart';
import 'package:degdeg/presentation/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../logic/utility/utilities.dart';
import '../widgets/accounts/account_list.dart';

class AccountScreen extends StatelessWidget {
  final String memberMobile;
  const AccountScreen({super.key, required this.memberMobile});

  @override
  Widget build(BuildContext context) {
    return BlocListener<SaveAccountsCubit, SaveAccountsState>(
      listener: (context, state) {
        if (state is SaveAccountsStateLoading) {
          Utility.loadingDialog(context,isTrans: true,message: 'Loading');
        }
        if (state is SaveAccountsStateError) {
          Utility.closeDialog(context);
          Utility.errorDialog(context: context, message: state.message);
        }
        if (state is SaveAccountsStateLoaded) {
          Utility.closeDialog(context);
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
          child: CustomScrollView(slivers: [
            SliverToBoxAdapter(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  BlocBuilder<AccountsCubit, AccountsState>(
                    builder: (context, state) {
                      if (state is AccountsStateLoading) {
                        return const Center(child: CircularProgressIndicator());
                      }
                      if (state is AccountsStateError) {
                        return Text(state.message);
                      }
                      if (state is AccountsStateLoaded) {
                        final accountList = state.accounts;
                        return AccountList(
                          accountList: accountList,
                          mobile: memberMobile,
                        );
                      }
                      return Container();
                    },
                  )
                ],
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
