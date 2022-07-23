import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

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
                      // TODO Add Task
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

  // TODO Remove
  Stream<List<Map<String, dynamic>>> getFakeTaskStream() async* {

  }

  Widget getTasks() {
    // TODO Watch for database changes
    Timer? currentTimer;
    var resetStream = false;

    return StreamBuilder<List<Map<String, dynamic>>>(
      // TODO Replace
      stream: getFakeTaskStream(),
      builder: (context, AsyncSnapshot<List<Map<String, dynamic>>> snapshot) {
        if (snapshot.connectionState == ConnectionState.active &&
            snapshot.hasData) {
          // TODO Get Today's tasks
          return ListView.builder(
            // TODO Use task list count
            itemCount: 0,
            itemBuilder: (BuildContext context, int index) {
              return TaskCard(
                // TODO Add Task parameter
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
