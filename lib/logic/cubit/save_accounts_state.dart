part of 'save_accounts_cubit.dart';

class SaveAccountsState extends Equatable {
  const SaveAccountsState();

  @override
  List<Object> get props => [];
}

final class SaveAccountsInitial extends SaveAccountsState {}

class SaveAccountsStateLoading extends SaveAccountsState {}

class SaveAccountsStateError extends SaveAccountsState {
  final int code;
  final String message;

  const SaveAccountsStateError({required this.code, required this.message});
}

class SaveAccountsStateLoaded extends SaveAccountsState {
  final dynamic respone;

  const SaveAccountsStateLoaded({required this.respone});
}