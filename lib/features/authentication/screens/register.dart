// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hotel/features/authentication/cubit/authentication_cubit.dart';
import 'package:hotel/features/authentication/widgets/form_widget.dart';

import 'package:hotel/features/authentication/widgets/show_button.dart';

import '../cubit/authentication_state.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final _key = GlobalKey<FormState>();

  bool isChange = false;

  AuthenticationCubit? authenticationCubit;

  final _phoneNumber = TextEditingController();

  void saveItem() {
    _key.currentState?.validate();
  }

  @override
  void initState() {
    authenticationCubit = BlocProvider.of<AuthenticationCubit>(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthenticationCubit, AuthenticationState>(
        builder: (context, state) {
      return Scaffold(
        body: SingleChildScrollView(
          child: SizedBox(
            height: MediaQuery.of(context).size.height,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 30,
                ),
                Image.asset(
                  "assets/images/5831236.jpg",
                  height: 200,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
                const Spacer(
                  flex: 1,
                ),
                Container(
                  margin:
                      const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
                  alignment: Alignment.centerLeft,
                  child: const Text(
                    'Welcome to the MemoryBook',
                    style: TextStyle(
                      fontStyle: FontStyle.italic,
                      fontSize: 25,
                    ),
                  ),
                ),
                const Spacer(
                  flex: 1,
                ),
                Expanded(
                  flex: 4,
                  child: Container(
                    margin: const EdgeInsets.symmetric(horizontal: 25),
                    child: const FormWidget(),
                  ),
                ),
                if (state is AuthenticationShowButton)
                  state.isActive
                      ? CustomButton(
                          phoneNumber: _phoneNumber.text,
                        )
                      : const SizedBox(
                          height: 10,
                        ),
                const Spacer(
                  flex: 1,
                ),
                Padding(
                    padding: EdgeInsets.only(
                        bottom: MediaQuery.of(context).viewInsets.bottom))
              ],
            ),
          ),
        ),
      );
    });
  }
}
