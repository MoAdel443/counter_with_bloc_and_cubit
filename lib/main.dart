import 'package:flutter/material.dart';
import 'package:train_bloc_cubit/bloc/my_bloc_observer.dart';
import 'package:train_bloc_cubit/cubit/counter_cubit.dart';
import 'package:train_bloc_cubit/screens/counter_screen.dart';
import 'package:train_bloc_cubit/bloc/bloc_imports.dart';

void main() {
  Bloc.observer = MyBlocObserver();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => CounterBloc(),
        ),
        BlocProvider(
          create: (context) => CounterCubit(),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const CounterScreen(),
      ),
    );
  }
}
