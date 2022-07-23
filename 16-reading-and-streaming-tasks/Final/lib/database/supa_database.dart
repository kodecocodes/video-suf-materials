import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart' as riverpod;
import 'package:supabase_flutter/supabase_flutter.dart';

import '../models/tasks.dart';
import '../ui/login/login_state.dart';

const taskTable = 'Tasks';
const categoryTable = 'Category';
const userId = 'userId';
const categoryId = 'categoryId';
const id = 'id';
const tokenExpired = 'JWT expired';

typedef TodayFilter = bool Function(Task);

final supaBaseDatabaseProvider =
    riverpod.Provider<SupaDatabaseRepository>((ref) {
  return SupaDatabaseRepository(ref);
});
final taskStreamProvider =
    riverpod.StreamProvider<List<Map<String, dynamic>>>((ref) {
  final repo = ref.watch(supaBaseDatabaseProvider);
  return repo.getTaskStream();
});

class SupaDatabaseRepository extends ChangeNotifier {
  late SupabaseClient client;
  final riverpod.ProviderRef ref;
  Stream<List<Map<String, dynamic>>>? taskStream;
  late LoginStateNotifier loginStateNotifier;

  SupaDatabaseRepository(this.ref) {
    client = Supabase.instance.client;
    loginStateNotifier = ref.read(logInStateProvider.notifier);
  }

  Future<List<dynamic>?> addDataToTable(
      String tableName, List<Map<String, dynamic>> tableData) async {
    final response = await client.from(tableName).insert(tableData).execute();
    final error = response.error;
    if (error != null && response.status != 406) {
      log('Error adding data $error');
      return Future.value(null);
    }
    final data = response.data;
    return data;
  }

  Future<Task?> addTask(Task task) async {
    final data = await addDataToTable(
        taskTable, taskToDatabaseJson(task, client.auth.currentUser!.id));
    if (data != null && data.isNotEmpty) {
      notifyListeners();
      return Task.fromJson(data[0]);
    }
    return null;
  }

  Future<List<dynamic>?> _listTable(String tableName) async {
    final response = await client
        .from(tableName)
        .select()
        .eq(userId, client.auth.currentUser!.id)
        .execute();
    final error = response.error;
    if (error != null && response.status != 406) {
      log('Error in listTable $error');
      return null;
    }
    return response.data;
  }

  Stream<List<Map<String, dynamic>>> getTaskStream() {
    if (taskStream != null) {
      return taskStream!;
    }
    taskStream = client
        .from('Tasks:userId=eq.${client.auth.currentUser!.id}')
        .stream(['id']).execute();
    log('New stream');
    return taskStream!;
  }

  List<Task> filterTasks(List<Map<String, dynamic>> data, TodayFilter filter) {
    final tasks = <Task>[];
    for (final taskMap in data) {
      final task = Task.fromJson(taskMap);
      if (filter(task)) {
        tasks.add(task);
      }
    }
    return tasks;
  }

  List<Task> filterTodayTasks(List<Map<String, dynamic>> data) {
    return filterTasks(data, (task) {
      return (false == task.done && false == task.doLater);
    });
  }
}
