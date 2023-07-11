import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'env.dart';
import 'features/authentication/cubit/authentication_cubit.dart';
import 'features/authentication/cubit/authentication_state.dart';
import 'main.dart';

void main() {
  AppEnvironment.setupEnv(Environment.prod);
  runApp(MultiBlocProvider(providers: [
    BlocProvider(
      create: (context) => AuthenticationCubit(
        AuthenticationInitial(),
      ),
    ),
  ], child: const MyApp()));
}
