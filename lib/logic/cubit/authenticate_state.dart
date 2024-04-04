part of 'authenticate_cubit.dart';

 class AuthenticateState extends Equatable {
  const AuthenticateState();

  @override
  List<Object> get props => [];
}

class AuthenticateStateInitial extends AuthenticateState {
   const AuthenticateStateInitial();
}

class AuthenticateStateLoading extends AuthenticateState {
  const AuthenticateStateLoading();
}

class AuthenticateStateError extends AuthenticateState {
  final String error;
  const AuthenticateStateError(this.error);
}

class AuthenticateStateCodeSent extends AuthenticateState {
  final String verificationId;
  final int? resendToken;
  const AuthenticateStateCodeSent(this.verificationId, this.resendToken);
}

class AuthenticateStateVerificationCompleted extends AuthenticateState {
  const AuthenticateStateVerificationCompleted();
}
