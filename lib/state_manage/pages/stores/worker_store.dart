import 'package:flutter/material.dart';

import '../../services/worker_service.dart';
import 'worker_state.dart';

class WorkerStore extends ChangeNotifier {
  final service = WorkerService();
  WorkerState state = EmptyWorkerState();

  Future<void> initWorkers() async {
    state = LoadingWorkerState();
    notifyListeners();
    try {
      final response = await service.fetchAll();
      state = LoadedWorkerState(response);
      notifyListeners();
    } catch (e) {
      state = ErrorWorkerState('Failed to load worker');
      notifyListeners();
    }
  }

  void clear() {
    if (state is LoadedWorkerState) {
      (state as LoadedWorkerState).workers.clear();
    }
  }
}
