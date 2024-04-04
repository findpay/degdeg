
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/repositories/account_repository.dart';

part 'save_accounts_state.dart';

class SaveAccountsCubit extends Cubit<SaveAccountsState> {
  final AccountRepository _accountRepository;
  SaveAccountsCubit({required accountRepository})
      : _accountRepository = accountRepository,
        super(SaveAccountsInitial());

  saveAccounts(Map<String, dynamic> body) async {
    emit(SaveAccountsStateLoading());

    final result = await _accountRepository.saveAccounts(body);
    result.fold(
      (failure) {
        var errorState = SaveAccountsStateError(
            code: failure.statusCode, message: failure.message);
        emit(errorState);
      },
      (value) {
        emit(SaveAccountsStateLoaded(respone: value));
      },
    );
  }
}
