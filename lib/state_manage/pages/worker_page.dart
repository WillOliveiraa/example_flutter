import 'package:flutter/material.dart';

import '../models/worker.dart';
import '../services/worker_service.dart';

class WorkerPage extends StatefulWidget {
  const WorkerPage({super.key});

  @override
  State<WorkerPage> createState() => _WorkerPageState();
}

class _WorkerPageState extends State<WorkerPage> {
  late WorkerService service;
  final List<Worker> workers = [];
  var loading = false;
  String messageError = '';

  @override
  void initState() {
    super.initState();
    service = WorkerService();
  }

  Future<void> initWorkers() async {
    if (workers.isEmpty) {
      setState(() => loading = true);
      final response = await service.fetchAll();
      setState(() {
        workers.addAll(response);
        loading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Worker Page')),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 8, bottom: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {
                    initWorkers();
                  },
                  child: const Text('Fetch all'),
                ),
                ElevatedButton(
                  onPressed: () => setState(() => workers.clear()),
                  child: const Text('Clear'),
                ),
              ],
            ),
          ),
          Builder(
            builder: (context) {
              if (loading) {
                return const Expanded(
                  child: Center(
                    child: CircularProgressIndicator(),
                  ),
                );
              }

              if (workers.isEmpty) {
                return const SizedBox();
              }

              if (workers.isEmpty) {
                return const Center(child: Text('Error!'));
              }

              return Expanded(
                child: ListView.separated(
                  separatorBuilder: (context, index) => const Padding(
                    padding: EdgeInsetsDirectional.symmetric(vertical: 8),
                    child: Divider(),
                  ),
                  itemCount: workers.length,
                  itemBuilder: (_, index) {
                    final worker = workers[index];
                    return ListTile(
                      leading: const Icon(Icons.person),
                      title: Text('${worker.firstName} ${worker.lastName}'),
                      subtitle: Text(worker.email),
                    );
                  },
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
