// ignore_for_file: use_build_context_synchronously

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hotel/features/authentication/cubit/authentication_state.dart';

import 'package:hotel/home_page.dart';

import '../cubit/authentication_cubit.dart';

class OtpVerificationScreenState extends StatefulWidget {
  const OtpVerificationScreenState({super.key, required this.response});
  final Response<dynamic>? response;

  @override
  State<OtpVerificationScreenState> createState() =>
      _OtpVerificationScreenStateState();
}

class _OtpVerificationScreenStateState
    extends State<OtpVerificationScreenState> {
  String otp = '';
  AuthenticationCubit? authenticationCubit;
  @override
  void initState() {
    authenticationCubit = BlocProvider.of<AuthenticationCubit>(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Verify'),
      ),
      body: Container(
        margin: const EdgeInsets.all(20),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: TextField(
                onSubmitted: (value) async {
                  otp = value;
                },
                textAlign: TextAlign.center,
                decoration: const InputDecoration(
                    label: Text('Enter OTP'),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)))),
                keyboardType: TextInputType.number,
                inputFormatters: [LengthLimitingTextInputFormatter(6)],
              ),
            ),
            ElevatedButton(
                onPressed: () async {
                  authenticationCubit?.emit(AuthenticationRegisterLoading(
                      const CircularProgressIndicator()));
                  Response? response =
                      await authenticationCubit?.verifyUser(otp: otp);
                  print(response?.statusCode);
                  print(response?.data);
                  if (response != null || response?.statusCode == 200) {
                    Navigator.of(context).pushReplacement(MaterialPageRoute(
                      builder: (context) => const HomePage(),
                    ));
                  } else {
                    ScaffoldMessenger.of(context).clearSnackBars();
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Something went wrong!'),
                      ),
                    );
                  }
                },
                child: const Text('Submit'))
          ],
        ),
      ),
    );
  }
}
