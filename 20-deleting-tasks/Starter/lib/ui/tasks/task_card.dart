import 'dart:developer';

import 'package:flutter/material.dart';

import '../utils.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../models/tasks.dart';
import '../../database/supa_database.dart';

typedef OnChanged = void Function();

// ignore: must_be_immutable
class TaskCard extends ConsumerStatefulWidget {
  Task task;
  final OnChanged? onChanged;

  TaskCard({Key? key, required this.task, this.onChanged}) : super(key: key);

  @override
  ConsumerState createState() => _TaskCardState();
}

class _TaskCardState extends ConsumerState<TaskCard> {
  @override
  Widget build(BuildContext context) {
    return buildRow();
  }

  Widget buildRow() {
    final repository = ref.watch(supaBaseDatabaseProvider);
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
                Text(
                  widget.task.name,
                  style: largeBlackText,
                ),
                const SizedBox(
                  height: 8,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Checkbox(
                      value: widget.task.done,
                      onChanged: (changed) async {
                        setState(
                          () {
                            widget.task = widget.task.copyWith(
                                done: !(true == widget.task.done),
                                doLater: false);
                          },
                        );
                        updateTask(repository);
                        widget.onChanged?.call();
                      },
                    ),
                    const Text('Done'),
                    const SizedBox(
                      width: 8,
                    ),
                    Checkbox(
                      value: widget.task.doLater,
                      onChanged: (changed) async {
                        setState(
                          () {
                            widget.task = widget.task.copyWith(
                                doLater: !(true == widget.task.doLater),
                                done: false);
                          },
                        );
                        updateTask(repository);
                        widget.onChanged?.call();
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

// TODO Add Toggle code
  void updateTask(SupaDatabaseRepository repository) async {
    final result = await repository.updateTask(widget.task);
    result.when(
        success: (updatedTask) => widget.task = updatedTask,
        failure: (error) {
          log(error.toString(), stackTrace: error.stackTrace);
          if (!mounted) return;
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text(error.toString())));
        },
        errorMessage: (code, message) {
          log(message.toString());
          if (!mounted) return;
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text(message.toString())));
        });
    widget.onChanged?.call();
  }
}
