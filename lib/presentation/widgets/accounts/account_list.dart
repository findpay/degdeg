import 'package:degdeg/logic/cubit/save_accounts_cubit.dart';
import 'package:degdeg/presentation/widgets/custom_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../data/model/acoount_model.dart';
import '../custom_image.dart';
import '../custom_textformfield.dart';

class AccountList extends StatelessWidget {
  final List<AccountsModel> accountList;
  final String mobile;
  const AccountList(
      {super.key, required this.accountList, required this.mobile});

  @override
  Widget build(BuildContext context) {
    List<TextEditingController> controllers = List.generate(
      accountList.length,
      (index) => TextEditingController(),
    );
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: 50,
        ),
        Text(
          "Add your accounts",
          style: Theme.of(context).textTheme.bodyText2!.copyWith(
                fontWeight: FontWeight.w500,
                fontSize: 16,
              ),
        ),
        ListView.builder(
          padding: EdgeInsets.zero,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: accountList.length,
          itemBuilder: (context, index) {
            return Container(
              margin: const EdgeInsets.symmetric(vertical: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    accountList[index].name,
                    style: Theme.of(context).textTheme.bodyText2!.copyWith(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          color: const Color(0xffA2A0A8),
                        ),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  CustomTextFormField(
                    hintText: '',
                    textEditingController: controllers[index],
                    capitalization: TextCapitalization.none,
                    prefix: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        CustomImage(
                          path: accountList[index].icon.formats.thumbnail.url,
                          width: 50,
                          height: 30,
                        ), // Custom image
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
        ),
        const SizedBox(
          height: 16,
        ),
        CustomButton(
          context: context,
          title: 'Save',
          onTap: () {
            List accounts = [];
            for (var i = 0; i < accountList.length; i++) {
              Map<String, dynamic> obj = {
                "id": accountList[i].id,
                "name": accountList[i].name,
                "type": accountList[i].type,
                "account_number": controllers[i].text
              };
              accounts.add(obj);
            }
            Map<String, dynamic> body = {
              "data": {"member": mobile, "accounts": accounts}
            };
            context.read<SaveAccountsCubit>().saveAccounts(body);
          },
        )
      ],
    );
  }
}
