
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:train_bloc_cubit/cubit/counter_cubit_states.dart';

class CounterCubit extends Cubit<CounterCubitState>{

  CounterCubit() :super(CounterCubitInitState());


  void increment(){
    emit(CounterCubitIncrementState(state.counterValue +1));
  }

  void decrement(){
    emit(CounterCubitDecrementState(state.counterValue -1));
  }
}