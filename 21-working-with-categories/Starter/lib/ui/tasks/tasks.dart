import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../database/supa_database.dart';
import '../../models/tasks.dart';
import '../dialog/new_item.dart';
import '../utils.dart';
import 'task_card.dart';

class Tasks extends ConsumerStatefulWidget {
  const Tasks({Key? key}) : super(key: key);

  @override
  ConsumerState<Tasks> createState() => _TasksState();
}

class _TasksState extends ConsumerState<Tasks> {
  @override
  Widget build(BuildContext context) {
    // TODO Watch for database changes
    return Container(
      decoration: const BoxDecoration(color: Colors.white),
      child: Stack(
        children: [
          getTasks(),
          Positioned(
            bottom: 10,
            right: 10,
            child: FloatingActionButton(
              backgroundColor: startGradientColor,
              child: const Icon(
                Icons.add,
                color: Colors.black,
              ),
              onPressed: () {
                showNewDialog('New Task', (String? name) {
                  if (name != null) {
                    setState(() {
                      ref
                          .read(supaBaseDatabaseProvider)
                          .addTask(Task(name: name));
                    });
                  }
                });
              },
            ),
          ),
        ],
      ),
    );
  }

  void showNewDialog(String title, NameCallBack callBack) {
    showDialog(
      context: context,
      builder: (context) => NewItemDialog(
        title: title,
        callBack: callBack,
      ),
    );
  }

  Stream<List<Map<String, dynamic>>> getFakeTaskStream() async* {

  }

  Widget getTasks() {
    final repository = ref.watch(supaBaseDatabaseProvider);
    final taskStream = ref.watch(taskStreamProvider.stream);
    Timer? currentTimer;
    var resetStream = false;

    return StreamBuilder<List<Map<String, dynamic>>>(
      stream: getFakeTaskStream(),
      builder: (context, AsyncSnapshot<List<Map<String, dynamic>>> snapshot) {
        if (snapshot.connectionState == ConnectionState.active &&
            snapshot.hasData) {
          final tasks = repository.filterTodayTasks(snapshot.data!);
          return ListView.builder(
            itemCount: tasks.length,
            itemBuilder: (BuildContext context, int index) {
              return TaskCard(
                task: tasks[index],
                onChanged: () {
                  setState(() {});
                },
              );
            },
          );
        } else {
           return Container();
        }
      },
    );
  }
}
