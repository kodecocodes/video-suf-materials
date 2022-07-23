import 'package:flutter/material.dart';

import '../utils.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

typedef OnChanged = void Function();

// ignore: must_be_immutable
class TaskCard extends ConsumerStatefulWidget {
  // TODO Add Task
  final OnChanged? onChanged;

  // TODO Add Task parameter
  TaskCard({Key? key, this.onChanged}) : super(key: key);

  @override
  ConsumerState createState() => _TaskCardState();
}

class _TaskCardState extends ConsumerState<TaskCard> {
  @override
  Widget build(BuildContext context) {
    return buildRow();
  }

  Widget buildRow() {
    // TODO Watch for database changes
    return Card(
      color: startGradientColor,
      elevation: 4.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // TODO Widget Task name
                const Text(
                  'Task',
                  style: largeBlackText,
                ),
                const SizedBox(
                  height: 8,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Checkbox(
                      // TODO Add done state
                      value: false,
                      onChanged: (changed) async {
                        setState(
                              () {
                            // TODO Update done state
                          },
                        );
                        // TODO Call updateTask
                      },
                    ),
                    const Text('Done'),
                    const SizedBox(
                      width: 8,
                    ),
                    Checkbox(
                      // TODO Use do later flag
                      value: false,
                      onChanged: (changed) async {
                        setState(
                              () {
                            // TODO Update task
                          },
                        );
                        // TODO Call updateTask
                      },
                    ),
                    const Text('Do Later'),
                    const SizedBox(
                      width: 8,
                    ),
                  ],
                ),
              ],
            ),
            const Spacer(),
            IconButton(
                onPressed: () async {
                  // TODO Delete task
                },
                icon: const Icon(
                  Icons.delete,
                  color: Colors.red,
                )),
          ],
        ),
      ),
    );
  }

// TODO Add updateTask code
}