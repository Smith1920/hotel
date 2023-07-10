import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hotel/features/authentication/cubit/authentication_state.dart';

import '../repository/authentication_repository.dart';

class AuthenticationCubit extends Cubit<AuthenticationState> {
  AuthenticationCubit(super.initialState);

  final AuthenticationRepository _authenticationRepository =
      AuthenticationRepository();

  Future<void> registerUser(String number) async {
    AuthenticationRegisterLoading();
    var verifyUser = await _authenticationRepository.sendOtp(number);
    if (verifyUser != null) {
      emit(AuthenticationRegisterSuccess('Success.'));
    } else {
      emit(AuthenticationRegisterError('Something went wrong.'));
    }
  }

  bool showButton(int length) {
    if (length == 10) {
      emit(AuthenticationShowButton(true));
      return true;
    } else {
      emit(AuthenticationShowButton(false));
      return false;
    }
  }

  void setState(AuthenticationState state) {
    emit(state);
  }
}
