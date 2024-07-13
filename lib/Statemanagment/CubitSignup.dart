
import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

import 'StateSignup.dart';

class SigUpCubit extends Cubit<SigupState> {
  SigUpCubit() : super(initialState());

  Future<void> Regsister(
      {required String email, required String password}) async {
    try {
      EasyLoading.show(status: "please wait...");
      emit(LoadingState());
      final credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      EasyLoading.dismiss();
      emit(SuccessState());
    } on FirebaseAuthException catch (e) {
      EasyLoading.dismiss();
      if (e.code == 'weak-password') {
        emit(FailureState(
            errorMessage: 'The password is weak'));
      } else if (e.code == 'email-already-in-use') {
        emit(FailureState(
            errorMessage: 'This email already exists'));
      } else {
        emit(FailureState(errorMessage: 'Error'));
      }
    }
  }
}
