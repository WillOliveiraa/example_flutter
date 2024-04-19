// state pattern
import '../../models/worker.dart';

// sealed
abstract class WorkerState {}

class EmptyWorkerState implements WorkerState {}

class LoadingWorkerState implements WorkerState {}

class ErrorWorkerState implements WorkerState {
  final String messageError;

  ErrorWorkerState(this.messageError);
}

class LoadedWorkerState implements WorkerState {
  final List<Worker> workers;

  LoadedWorkerState(this.workers);
}
