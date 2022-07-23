import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../tasks/task_card.dart';

class DoLater extends ConsumerStatefulWidget {
  const DoLater({Key? key}) : super(key: key);

  @override
  ConsumerState<DoLater> createState() => _DoLaterState();
}

class _DoLaterState extends ConsumerState<DoLater> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(color: Colors.white),
      child: getTasks(),
    );
  }

  Stream<List<Map<String, dynamic>>> getFakeTaskStream() async* {

  }

  Widget getTasks() {
    // TODO Watch for database changes
    return StreamBuilder<List<Map<String, dynamic>>>(
      // TODO Get Task stream
      stream: getFakeTaskStream(),
      builder: (context, AsyncSnapshot<List<Map<String, dynamic>>> snapshot) {
        if (snapshot.connectionState == ConnectionState.active &&
            snapshot.hasData) {
          // TODO Get Do later tasks
          return ListView.builder(
            // TODO Use task list
            itemCount: 0,
            itemBuilder: (BuildContext context, int index) {
              return TaskCard(
                // TODO Add Task parameter
                onChanged: () {
                  setState(
                        () {
                    },
                  );
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
