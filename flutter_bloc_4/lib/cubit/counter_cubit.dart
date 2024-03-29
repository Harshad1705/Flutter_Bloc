import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter_bloc_4/constants/enums.dart';

import 'internet_cubit.dart';

part 'counter_state.dart';

class CounterCubit extends Cubit<CounterState> {
  final InternetCubit internetCubit;
  StreamSubscription internetStreamSubscription;

  CounterCubit({required this.internetCubit})
      : super(CounterState(counterValue: 0, wasIncremented: null)) {
    internetStreamSubscription = internetCubit.listen((internetState) {
      if (internetState is InternetConnected &&
          internetState.connectionType == ConnectionType.Wifi) {
        increment();
      } else if (internetState is InternetDisconnected &&
          internetState.connectionType == ConnectionType.Mobile) {
        decrement();
      }
    });
  }

  void increment() => emit(
      CounterState(counterValue: state.counterValue + 1, wasIncremented: true));
  void decrement() => emit(CounterState(
      counterValue: state.counterValue - 1, wasIncremented: false));


  @override
  Future<void> close() {
    internetStreamSubscription.cancel();
    return super.close();
  }
}
