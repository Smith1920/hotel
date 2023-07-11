// ignore_for_file: must_be_immutable, prefer_const_constructors_in_immutables, prefer_typing_uninitialized_variables, use_build_context_synchronously

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hotel/env.dart';
import 'package:hotel/features/authentication/screens/otp_verification_screen.dart';

import '../cubit/authentication_cubit.dart';
import '../cubit/authentication_state.dart';

class CustomButton extends StatefulWidget {
  CustomButton({super.key, required this.phoneNumber});
  final phoneNumber;
  @override
  State<CustomButton> createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  AuthenticationCubit? authenticationCubit;
  @override
  void initState() {
    authenticationCubit = BlocProvider.of<AuthenticationCubit>(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthenticationCubit, AuthenticationState>(
        builder: (context, state) {
      if (state is AuthenticationShowButton) {
        return Visibility(
          visible: state.isActive,
          child: ElevatedButton(
            style: ButtonStyle(
              backgroundColor: MaterialStatePropertyAll(AppEnvironment.color),
              padding: const MaterialStatePropertyAll(
                  EdgeInsets.symmetric(horizontal: 100, vertical: 10)),
              shape: const MaterialStatePropertyAll(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(10),
                  ),
                ),
              ),
            ),
            onPressed: () async {
              // authenticationCubit?.emit(AuthenticationRegisterLoading(
              //     const CircularProgressIndicator()));
              // Response? response = await authenticationCubit?.registerUser(
              //     number: widget.phoneNumber);
              // print(response?.statusCode);
              // print(response?.data);
              // Navigator.of(context).push(MaterialPageRoute(
              //   builder: (context) =>
              //       OtpVerificationScreenState(response: response),
              // ));

              authenticationCubit?.registerUser(
                number: widget.phoneNumber,
              );
            },
            child: const Text(
              'Submit',
              style:
                  TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
            ),
          ),
        );
      } else {
        return const SizedBox(
          height: 10,
        );
      }
    });
  }
}
