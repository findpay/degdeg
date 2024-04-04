// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'home_cubit.dart';

class HomeState extends Equatable {
  const HomeState();
  

  @override
  List<Object> get props => [];
}

class HomeInitialState extends HomeState {}

class HomeErrorState extends HomeState {
  final String code;
  final String message;
  const HomeErrorState({
    required this.code,
    required this.message,
  });
}

class HomeLoadingState extends HomeState {}

class HomeChangeState extends HomeState {}

class HomeLoadedState extends HomeState {
  const HomeLoadedState();

}
