// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tasks.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Task _$$_TaskFromJson(Map<String, dynamic> json) => _$_Task(
      name: json['name'] as String,
      id: json['id'] as int?,
      userId: json['userId'] as String?,
      done: json['done'] as bool?,
      doLater: json['doLater'] as bool?,
      categoryId: json['categoryId'] as int?,
    );

Map<String, dynamic> _$$_TaskToJson(_$_Task instance) {
  final val = <String, dynamic>{
    'name': instance.name,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id);
  writeNotNull('userId', instance.userId);
  writeNotNull('done', instance.done);
  writeNotNull('doLater', instance.doLater);
  writeNotNull('categoryId', instance.categoryId);
  return val;
}
