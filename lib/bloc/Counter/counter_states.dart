part of 'counter_bloc.dart';


abstract class CounterState {
  int counterValue;

  CounterState({required this.counterValue});
}

class CounterInitState extends CounterState {
  CounterInitState() : super(counterValue: 0);
}

class CounterIncrementState extends CounterState {
  CounterIncrementState(int incrementValue) : super(counterValue: incrementValue);
}

class CounterDecrementState extends CounterState {
  CounterDecrementState(int DecrementValue) : super(counterValue: DecrementValue);
}