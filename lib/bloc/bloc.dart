import 'dart:async';

abstract class Bloc<T> {
  StreamController _streamController = StreamController<T>();
  Stream<T> get output => _streamController.stream;
  StreamSink<T> get input => _streamController.sink;

  Bloc({T state}) {
    if (state != null) {
      this.newState(state);
    } else {
      FutureOr<T> initialState = loadInitialState();
      if (initialState is Future<T>) {
        initialState.then((initial) => this.newState(initial));
      } else if (initialState is T) {
        this.newState(initialState);
      }
    }
  }

  T _latestState;
  T get state => _latestState;

  FutureOr<T> loadInitialState();

  void newState(T state) {
    this._latestState = state;
    input.add(state);
  }

  void dispose() {
    _streamController.close();
  }
}
