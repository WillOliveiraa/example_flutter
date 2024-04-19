import 'package:flutter/material.dart';

import 'stores/worker_store.dart';

class WorkerPage extends StatefulWidget {
  const WorkerPage({super.key});

  @override
  State<WorkerPage> createState() => _WorkerPageState();
}

class _WorkerPageState extends State<WorkerPage> {
  final store = WorkerStore();

  @override
  void initState() {
    super.initState();
    store.addListener(() => setState(() {}));
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
                    store.initWorkers();
                  },
                  child: const Text('Fetch all'),
                ),
                ElevatedButton(
                  onPressed: () => store.clear(),
                  child: const Text('Clear'),
                ),
              ],
            ),
          ),
          Builder(
            builder: (_) {
              if (store.loading) {
                return const Expanded(
                  child: Center(
                    child: CircularProgressIndicator(),
                  ),
                );
              }

              if (store.workers.isEmpty) {
                return const SizedBox();
              }

              if (store.messageError.isNotEmpty) {
                return const Center(child: Text('Error!'));
              }

              return Expanded(
                child: ListView.separated(
                  separatorBuilder: (context, index) => const Padding(
                    padding: EdgeInsetsDirectional.symmetric(vertical: 8),
                    child: Divider(),
                  ),
                  itemCount: store.workers.length,
                  itemBuilder: (_, index) {
                    final worker = store.workers[index];
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
