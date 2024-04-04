part of 'member_cubit.dart';

class NewMemberState extends Equatable {
  const NewMemberState();

  @override
  List<Object> get props => [];
}

class NewMemberInitial extends NewMemberState {}

class NewMemberLoadingState extends NewMemberState {}

class NewMembeErrorState extends NewMemberState {
  final int code;
  final String message;

  const NewMembeErrorState({required this.code, required this.message});
}

class NewMemberLoadedState extends NewMemberState {
  final MemberModel data;

  const NewMemberLoadedState({required this.data});
}
