import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';

part 'authenticate_state.dart';

class AuthenticateCubit extends Cubit<AuthenticateState> {
  AuthenticateCubit() : super(const AuthenticateStateInitial());
  FirebaseAuth auth = FirebaseAuth.instance;

  verifyPhoneNumber(String mobile) async {
    emit(const AuthenticateStateLoading());

    await FirebaseAuth.instance.verifyPhoneNumber(
      phoneNumber: '+$mobile',
      verificationCompleted: (PhoneAuthCredential credential) async {
        await auth.signInWithCredential(credential);
        emit(const AuthenticateStateVerificationCompleted());
      },
      verificationFailed: (FirebaseAuthException e) {
        String errorMessage;
        switch (e.code) {
          case 'invalid-phone-number':
            errorMessage = 'The provided phone number is not valid.';
            break;
          default:
            errorMessage = 'An error occurred: ${e.message}';
            break;
        }
        emit(AuthenticateStateError(errorMessage));
      },
      codeSent: (String verificationId, int? resendToken) {
        emit(AuthenticateStateCodeSent(verificationId,resendToken));
      },
      codeAutoRetrievalTimeout: (String verificationId) {
        emit(AuthenticateStateError(verificationId));
      },
    );
  }
}
