import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/authentication_cubit.dart';
import '../cubit/authentication_state.dart';

class FormWidget extends StatefulWidget {
  const FormWidget({super.key});

  @override
  State<FormWidget> createState() => _FormWidgetState();
}

class _FormWidgetState extends State<FormWidget> {
  AuthenticationCubit? authenticationCubit;
  final TextEditingController _phoneNumber = TextEditingController();
  final _key = GlobalKey<FormState>();

  @override
  void initState() {
    authenticationCubit = BlocProvider.of<AuthenticationCubit>(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthenticationCubit, AuthenticationState>(
      builder: (context, state) {
        return Form(
          key: _key,
          child: TextFormField(
            inputFormatters: [
              LengthLimitingTextInputFormatter(10),
            ],
            validator: (value) {
              if (value?.length != 10) {
                return 'Number must be 10-Digits';
              }
              return null;
            },
            onChanged: (value) {
              authenticationCubit?.showButton(value.length);
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
        );
      },
    );
  }
}
