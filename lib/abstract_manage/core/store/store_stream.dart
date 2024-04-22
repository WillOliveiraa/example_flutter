import 'dart:async';

import 'store.dart';

abstract class StoreStream<T> implements Store<T> {
  final _streamController = StreamController<T>.broadcast();
  T _state;
  StoreStream(this._state);

  @override
  T get state => _state;

  @override
  void dispatch(T state) {
    _state = state;
    _streamController.add(state);
  }

  @override
  StoreDispose connect(void Function(T) listener) {
    final sub = _streamController.stream.listen(listener);
    return () => sub.cancel();
  }

  @override
  void dispose() {
    _streamController.close();
  }
}
