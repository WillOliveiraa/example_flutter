import 'package:flutter/material.dart';

import '../../models/worker.dart';
import '../../services/worker_service.dart';

class WorkerStore extends ChangeNotifier {
  final service = WorkerService();

  final List<Worker> workers = [];
  var loading = false;
  String messageError = '';

  Future<void> initWorkers() async {
    if (workers.isEmpty) {
      loading = true;
      notifyListeners();
      try {
        final response = await service.fetchAll();
        workers.addAll(response);
        loading = false;
        notifyListeners();
      } catch (e) {
        messageError = 'Failed to load worker';
        notifyListeners();
      }
    }
  }

  void clear() {
    workers.clear();
  }
}
