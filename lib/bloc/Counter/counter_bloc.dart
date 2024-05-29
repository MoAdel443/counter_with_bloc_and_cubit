import 'package:flutter_bloc/flutter_bloc.dart';

part 'counter_states.dart';
part 'counter_events.dart';

class CounterBloc extends Bloc<CounterEvents, CounterState> {
  CounterBloc() : super(CounterInitState()) {
    on<CounterIncrementEvent>((event, emit) {
      emit(CounterIncrementState(state.counterValue + 1));
    });

    on<CounterDecrementEvent>((event, emit) {
      emit(CounterDecrementState(state.counterValue - 1));
    });
  }
}
