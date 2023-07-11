import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hotel/features/authentication/cubit/authentication_state.dart';

import '../repository/authentication_repository.dart';

class AuthenticationCubit extends Cubit<AuthenticationState> {
  AuthenticationCubit(super.initialState);

  final AuthenticationRepository _authenticationRepository =
      AuthenticationRepository();

  Future<void> registerUser({required String number, Widget? widget}) async {
    //emit(AuthenticationRegisterLoading(const Text('Please Wait')));

    var verifyUser = await _authenticationRepository.sendOtp(number);
    if (verifyUser.statusCode == 200) {
      emit(AuthenticationRegisterSuccess('Success.'));
    } else {
      emit(AuthenticationRegisterError('Something went wrong.'));
    }
    print("Response :" + verifyUser.statusCode);
  }

  Future<Response> verifyUser({required String otp, Widget? widget}) async {
    AuthenticationRegisterLoading(widget ?? const CircularProgressIndicator());
    var verifyUser = await _authenticationRepository.verifyOtp(otp);
    if (verifyUser != null) {
      emit(AuthenticationRegisterSuccess('Success.'));
    } else {
      emit(AuthenticationRegisterError('Something went wrong.'));
    }
    return verifyUser;
  }

  void showButton(int length) {
    if (length == 10) {
      emit(AuthenticationShowButton(true));
    } else {
      emit(AuthenticationShowButton(false));
    }
  }

  void setState(AuthenticationState state) {
    emit(state);
  }
}
