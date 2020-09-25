import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';

abstract class AutoLoadCubit<T> extends Cubit<T> {
  AutoLoadCubit({T state}) : super(state) {
    if (state == null) {
      FutureOr<T> initialState = loadInitialState();
      if (initialState is Future<T>) {
        initialState.then((initial) => this.emit(initial));
      } else if (initialState is T) {
        this.emit(initialState);
      }
    }
  }

  FutureOr<T> loadInitialState();
}
