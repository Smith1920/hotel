// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hotel/features/authentication/cubit/authentication_cubit.dart';

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
                    child: Form(
                      key: _key,
                      child: TextFormField(
                        inputFormatters: [
                          LengthLimitingTextInputFormatter(11),
                        ],
                        validator: (value) {
                          if (value?.length != 10) {
                            return 'Number must be 10-Digits';
                          }
                          return null;
                        },
                        onChanged: (value) {
                          if (value.length == 10) {
                            isChange = true;

                            FocusManager.instance.primaryFocus?.unfocus();
                            _phoneNumber.text = value;
                          } else {
                            isChange = false;
                            authenticationCubit?.showButton(value.length);
                          }
                        },
                        keyboardType: TextInputType.number,
                        controller: _phoneNumber,
                        textAlign: TextAlign.start,
                        style: const TextStyle(fontSize: 20),
                        decoration: const InputDecoration(
                          prefix: Text('+91 '),
                          label: Text('Phone-Number'),
                          hintText: '00000 00000',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(15),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                authenticationCubit?.showButton(_phoneNumber.text.length) ??
                        false
                    ? const CustomButton()
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
