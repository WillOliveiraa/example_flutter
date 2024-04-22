import 'package:flutter/material.dart';

import 'store.dart';

abstract class StoreNotifier<T> implements Store<T> {
  final _changeNotifier = ChangeNotifier();
  T _state;
  StoreNotifier(this._state);

  @override
  T get state => _state;

  @override
  void dispatch(T state) {
    _state = state;
    _changeNotifier.notifyListeners();
  }

  @override
  StoreDispose connect(void Function(T) listener) {
    // _changeNotifier.addListener(() => listener(_state));
    _listener() => listener(state);
    _changeNotifier.addListener(_listener);
    return () => _changeNotifier.removeListener(() {});
  }

  @override
  void dispose() {
    _changeNotifier.dispose();
  }
}
