import 'package:flutter/material.dart';
import 'package:train_bloc_cubit/bloc/bloc_imports.dart';
import 'package:train_bloc_cubit/cubit/counter_cubit.dart';
import 'package:train_bloc_cubit/cubit/counter_cubit_states.dart';

class CounterScreen extends StatelessWidget {
  const CounterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        title: const Text(
          "Counter Screen",
          style: TextStyle(color: Colors.white, fontSize: 30),
        ),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text("Conter with Bloc",
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
          ),
          BlocConsumer<CounterBloc, CounterState>(
            builder: (context, state) {
              return Text(
                "${state.counterValue}",
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 50,
                ),
              );
            },
            listener: (context, state) {
              if (state is CounterIncrementState) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(
                      "Increment ${state.counterValue}",
                      style: const TextStyle(color: Colors.white),
                    ),
                    duration: const Duration(seconds: 1),
                    backgroundColor: Colors.blueGrey,
                  ),
                );
              } else if (state is CounterDecrementState) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(
                      "Decrement ${state.counterValue}",
                      style: const TextStyle(color: Colors.white),
                    ),
                    duration: const Duration(seconds: 1),
                    backgroundColor: Colors.blueGrey,
                  ),
                );
              }
            },
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              TextButton(
                  onPressed: () {
                    context.read<CounterBloc>().add(CounterDecrementEvent());
                  },
                  child: const Text(
                    "-",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 50),
                  )),
              TextButton(
                  onPressed: () {
                    context.read<CounterBloc>().add(CounterIncrementEvent());
                  },
                  child: const Text("+",
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 50))),
            ],
          ),
          const SizedBox(
            height: 30,
          ),
          const Text(
            "Conter with Cubit",
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
          ),
          BlocConsumer<CounterCubit, CounterCubitState>(
            builder: (context, state) {
              return Text(
                "${state.counterValue}",
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 50,
                ),
              );
            },
            listener: (context, state) {
              if (state is CounterCubitIncrementState) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(
                      "Increment ${state.counterValue}",
                      style: const TextStyle(color: Colors.white),
                    ),
                    duration: const Duration(seconds: 1),
                    backgroundColor: Colors.blueGrey,
                  ),
                );
              } else if (state is CounterCubitDecrementState) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(
                      "Decrement ${state.counterValue}",
                      style: const TextStyle(color: Colors.white),
                    ),
                    duration: const Duration(seconds: 1),
                    backgroundColor: Colors.blueGrey,
                  ),
                );
              }
            },
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              TextButton(
                  onPressed: () {
                    context.read<CounterCubit>().decrement();
                  },
                  child: const Text(
                    "-",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 50),
                  )),
              TextButton(
                  onPressed: () {
                    context.read<CounterCubit>().increment();
                  },
                  child: const Text("+",
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 50))),
            ],
          ),
        ],
      ),
    );
  }
}
