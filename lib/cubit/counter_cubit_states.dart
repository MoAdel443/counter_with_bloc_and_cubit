

abstract class CounterCubitState {
  int counterValue;

  CounterCubitState({required this.counterValue});
}

class CounterCubitInitState extends CounterCubitState {
  CounterCubitInitState() : super(counterValue: 0);
}

class CounterCubitIncrementState extends CounterCubitState {
  CounterCubitIncrementState(int incrementValue) : super(counterValue: incrementValue);
}

class CounterCubitDecrementState extends CounterCubitState {
  CounterCubitDecrementState(int DecrementValue) : super(counterValue: DecrementValue);
}