import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../tasks/task_card.dart';

class Done extends ConsumerStatefulWidget {
  const Done({Key? key}) : super(key: key);

  @override
  ConsumerState<Done> createState() => _DoneState();
}

class _DoneState extends ConsumerState<Done> {
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
      // TODO Add stream
      stream: getFakeTaskStream(),
      builder: (context, AsyncSnapshot<List<Map<String, dynamic>>> snapshot) {
        if (snapshot.connectionState == ConnectionState.active &&
            snapshot.hasData) {
          // TODO Get Done Tasks
          return ListView.builder(
            // TODO Add task count
            itemCount: 0,
            itemBuilder: (BuildContext context, int index) {
              return TaskCard(
                // TODO Add task parameter
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