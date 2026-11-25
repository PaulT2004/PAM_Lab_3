import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'pages/home.dart';
import 'data/app_data_repository.dart';
import 'cubit/app_data_cubit.dart';

void main() {
  runApp(
    BlocProvider(
      create: (context) => AppDataCubit(
        AppDataRepository(),
      )..loadData(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const HomePage(),
    );
  }
}
