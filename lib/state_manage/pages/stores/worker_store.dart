import 'package:flutter/material.dart';

import '../../services/worker_service.dart';
import 'worker_state.dart';

class WorkerStore extends ChangeNotifier {
  final service = WorkerService();
  var state = WorkerState.empty();

  Future<void> initWorkers() async {
    if (state.workers.isEmpty) {
      state = state.copyWith(loading: true);
      notifyListeners();
      try {
        final response = await service.fetchAll();
        state = state.copyWith(loading: false, workers: response);
        notifyListeners();
      } catch (e) {
        state = state.copyWith(messageError: 'Failed to load worker');
        notifyListeners();
      }
    }
  }

  void clear() {
    state.workers.clear();
  }
}
