// state pattern
import '../../models/worker.dart';

class WorkerState {
  final List<Worker> workers;
  final bool loading;
  final String messageError;

  WorkerState({
    required this.workers,
    required this.loading,
    required this.messageError,
  });

  factory WorkerState.empty() {
    return WorkerState(workers: [], loading: false, messageError: '');
  }

  WorkerState copyWith({
    List<Worker>? workers,
    bool? loading,
    String? messageError,
  }) {
    return WorkerState(
      workers: workers ?? this.workers,
      loading: loading ?? this.loading,
      messageError: messageError ?? this.messageError,
    );
  }
}
