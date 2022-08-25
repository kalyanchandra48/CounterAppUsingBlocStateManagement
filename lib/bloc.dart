import 'package:flutter_bloc/flutter_bloc.dart';

class Counter {}

class IncrementValue extends Counter {}

class DecrementValue extends Counter {}

class CounterBloc extends Bloc<Counter, int> {
  CounterBloc() : super(0) {
    on<IncrementValue>((event, emit) => emit(state + 1));
    on<DecrementValue>((event, emit) => emit(state > 0 ? state - 1 : state));
  }
}
