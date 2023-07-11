import 'package:flutter/material.dart';

abstract class AuthenticationState {}

class AuthenticationInitial extends AuthenticationState {}

class AuthenticationRegisterSuccess extends AuthenticationState {
  AuthenticationRegisterSuccess(this.msg);
  String msg;
}

class AuthenticationRegisterLoading extends AuthenticationState {
  AuthenticationRegisterLoading(this.widget);
  Widget widget;
}

class AuthenticationRegisterError extends AuthenticationState {
  AuthenticationRegisterError(this.msg);
  String msg;
}

class AuthenticationShowButton extends AuthenticationState {
  AuthenticationShowButton(this.isActive);
  bool isActive = false;
}

class AuthenticationTextChange extends AuthenticationState {
  AuthenticationTextChange(this.length);
  int length;
}
