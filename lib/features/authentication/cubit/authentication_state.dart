

abstract class AuthenticationState {}

class AuthenticationInitial extends AuthenticationState {}

class AuthenticationRegisterSuccess extends AuthenticationState {
  AuthenticationRegisterSuccess(this.msg);
  String msg;
}

class AuthenticationRegisterLoading extends AuthenticationState {}

class AuthenticationRegisterError extends AuthenticationState {
  AuthenticationRegisterError(this.msg);
  String msg;
}
