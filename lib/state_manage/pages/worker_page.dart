import 'package:example_flutter/state_manage/pages/stores/worker_state.dart';
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
          // ListenableBuilder
          Builder(
            builder: (_) {
              final state = store.state;
              if (state is LoadingWorkerState) {
                return const Expanded(
                  child: Center(
                    child: CircularProgressIndicator(),
                  ),
                );
              } else if (state is EmptyWorkerState) {
                return const SizedBox();
              } else if (state is ErrorWorkerState) {
                return const Center(child: Text('Error!'));
              } else if (state is LoadedWorkerState) {
                return Expanded(
                  child: ListView.separated(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 8,
                    ),
                    separatorBuilder: (context, index) => const Padding(
                      padding: EdgeInsetsDirectional.symmetric(vertical: 8),
                      child: Divider(),
                    ),
                    itemCount: state.workers.length,
                    itemBuilder: (_, index) {
                      final worker = state.workers[index];
                      return ListTile(
                        leading: const Icon(Icons.person),
                        title: Text(
                          '${worker.firstName} ${worker.lastName}',
                          style: const TextStyle(fontSize: 20),
                        ),
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              worker.email,
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.grey[700],
                              ),
                            ),
                            Text(worker.job),
                          ],
                        ),
                        onTap: () {
                          showDialog(
                            context: context,
                            builder: (context) => AlertDialog(
                              title: const Text('Alert'),
                              actions: [
                                TextButton(
                                  onPressed: () => Navigator.pop(context),
                                  child: const Text('Cancel'),
                                ),
                              ],
                              content: Text('Profession: ${worker.job}'),
                            ),
                          );
                        },
                      );
                    },
                  ),
                );
              }
              return const SizedBox();
            },
          ),
        ],
      ),
    );
  }
}
