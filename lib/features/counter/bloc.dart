import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'events.dart';

part 'states.dart';

class CounterBloc extends Bloc<CounterEvents, CounterStates> {
  CounterBloc() : super(CounterInitialState()) {
    on<CounterPlusEvent>(_plus);
    on<CounterMinusEvent>(_minus);
  }

  int count = 0;

  void _plus(
    CounterPlusEvent event,
    Emitter<CounterStates> emit,
  ) async {
    count++;
    emit(CounterPlusState());
  }

  void _minus(
    CounterMinusEvent event,
    Emitter<CounterStates> emit,
  ) async {
    count--;
    emit(CounterMinusState());
  }
}
