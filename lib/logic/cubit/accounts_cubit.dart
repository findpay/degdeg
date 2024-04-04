import 'package:equatable/equatable.dart';
import 'package:degdeg/data/model/acoount_model.dart';
import 'package:degdeg/data/repositories/account_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'accounts_state.dart';

class AccountsCubit extends Cubit<AccountsState> {
  final AccountRepository _accountRepository;
  AccountsCubit({required accountRepository})
      : _accountRepository = accountRepository,
        super(AccountsStateInitial()) {
    getAccounts();
  }

  getAccounts() async {
    emit(AccountsStateLoading());

    final result = await _accountRepository.getAccounts();
    result.fold(
      (failure) {
        var errorState = AccountsStateError(
            code: failure.statusCode, message: failure.message);
        emit(errorState);
      },
      (value) {
        emit(AccountsStateLoaded(accounts: value));
      },
    );
  }
}
