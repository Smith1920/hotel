import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hotel/env.dart';
import 'features/authentication/cubit/authentication_cubit.dart';
import 'features/authentication/cubit/authentication_state.dart';
import 'main.dart';

void main() {
  AppEnvironment.setupEnv(Environment.dev);
  runApp(MultiBlocProvider(providers: [
    BlocProvider(
      create: (context) => AuthenticationCubit(
        AuthenticationInitial(),
      ),
    ),
  ], child: const MyApp()));
}