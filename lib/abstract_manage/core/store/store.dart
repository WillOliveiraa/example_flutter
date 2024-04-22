abstract class Store<T> {
  T get state;

  void dispatch(T state);

  StoreDispose connect(void Function(T) listener);

  void dispose();
}

typedef StoreDispose = void Function();
