import 'package:freezed_annotation/freezed_annotation.dart';

part 'tasks.freezed.dart';

part 'tasks.g.dart';

List<Map<String, dynamic>> taskToDatabaseJson(Task task, String userId) {
  final tasks = <Map<String, dynamic>>[];
  final updatedTask = task.copyWith(userId: userId);
  tasks.add(updatedTask.toJson());
  return tasks;
}

@freezed
class Task with _$Task {
  @JsonSerializable(explicitToJson: true)
  factory Task({
    required String name,
    @JsonKey(includeIfNull: false) int? id,
    @JsonKey(includeIfNull: false) String? userId,
    @JsonKey(includeIfNull: false) bool? done,
    @JsonKey(includeIfNull: false) bool? doLater,
    @JsonKey(includeIfNull: false) int? categoryId,
  }) = _Task;

  factory Task.fromJson(Map<String, dynamic> json) => _$TaskFromJson(json);
}
