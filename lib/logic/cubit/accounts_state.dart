part of 'accounts_cubit.dart';

class AccountsState extends Equatable {
  const AccountsState();

  @override
  List<Object> get props => [];
}

class AccountsStateInitial extends AccountsState {}

class AccountsStateLoading extends AccountsState {}

class AccountsStateError extends AccountsState {
  final int code;
  final String message;

  const AccountsStateError({required this.code, required this.message});
}

class AccountsStateLoaded extends AccountsState {
  final List<AccountsModel> accounts;

  const AccountsStateLoaded({required this.accounts});
}
