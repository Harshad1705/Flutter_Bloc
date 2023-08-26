import 'dart:async';

import 'package:connectivity/connectivity.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

enum InternetState { Initial, Gained, Lost }

Connectivity _connectivity = Connectivity();
StreamSubscription? internetStreamSubscription;

class InternetCubit extends Cubit<InternetState> {
  InternetCubit() : super(InternetState.Initial) {
    internetStreamSubscription =
        _connectivity.onConnectivityChanged.listen((result) {
      if (result == ConnectivityResult.mobile ||
          result == ConnectivityResult.wifi) {
        emit(InternetState.Gained);
      } else {
        emit(InternetState.Lost);
      }
    });
  }
  @override
  Future<void> close() {
    internetStreamSubscription?.cancel();
    return super.close();
  }
}
