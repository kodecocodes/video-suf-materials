// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'tasks.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Task _$TaskFromJson(Map<String, dynamic> json) {
  return _Task.fromJson(json);
}

/// @nodoc
mixin _$Task {
  String get name => throw _privateConstructorUsedError;
  @JsonKey(includeIfNull: false)
  int? get id => throw _privateConstructorUsedError;
  @JsonKey(includeIfNull: false)
  String? get userId => throw _privateConstructorUsedError;
  @JsonKey(includeIfNull: false)
  bool? get done => throw _privateConstructorUsedError;
  @JsonKey(includeIfNull: false)
  bool? get doLater => throw _privateConstructorUsedError;
  @JsonKey(includeIfNull: false)
  int? get categoryId => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TaskCopyWith<Task> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TaskCopyWith<$Res> {
  factory $TaskCopyWith(Task value, $Res Function(Task) then) =
      _$TaskCopyWithImpl<$Res>;
  $Res call(
      {String name,
      @JsonKey(includeIfNull: false) int? id,
      @JsonKey(includeIfNull: false) String? userId,
      @JsonKey(includeIfNull: false) bool? done,
      @JsonKey(includeIfNull: false) bool? doLater,
      @JsonKey(includeIfNull: false) int? categoryId});
}

/// @nodoc
class _$TaskCopyWithImpl<$Res> implements $TaskCopyWith<$Res> {
  _$TaskCopyWithImpl(this._value, this._then);

  final Task _value;
  // ignore: unused_field
  final $Res Function(Task) _then;

  @override
  $Res call({
    Object? name = freezed,
    Object? id = freezed,
    Object? userId = freezed,
    Object? done = freezed,
    Object? doLater = freezed,
    Object? categoryId = freezed,
  }) {
    return _then(_value.copyWith(
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      userId: userId == freezed
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String?,
      done: done == freezed
          ? _value.done
          : done // ignore: cast_nullable_to_non_nullable
              as bool?,
      doLater: doLater == freezed
          ? _value.doLater
          : doLater // ignore: cast_nullable_to_non_nullable
              as bool?,
      categoryId: categoryId == freezed
          ? _value.categoryId
          : categoryId // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
abstract class _$$_TaskCopyWith<$Res> implements $TaskCopyWith<$Res> {
  factory _$$_TaskCopyWith(_$_Task value, $Res Function(_$_Task) then) =
      __$$_TaskCopyWithImpl<$Res>;
  @override
  $Res call(
      {String name,
      @JsonKey(includeIfNull: false) int? id,
      @JsonKey(includeIfNull: false) String? userId,
      @JsonKey(includeIfNull: false) bool? done,
      @JsonKey(includeIfNull: false) bool? doLater,
      @JsonKey(includeIfNull: false) int? categoryId});
}

/// @nodoc
class __$$_TaskCopyWithImpl<$Res> extends _$TaskCopyWithImpl<$Res>
    implements _$$_TaskCopyWith<$Res> {
  __$$_TaskCopyWithImpl(_$_Task _value, $Res Function(_$_Task) _then)
      : super(_value, (v) => _then(v as _$_Task));

  @override
  _$_Task get _value => super._value as _$_Task;

  @override
  $Res call({
    Object? name = freezed,
    Object? id = freezed,
    Object? userId = freezed,
    Object? done = freezed,
    Object? doLater = freezed,
    Object? categoryId = freezed,
  }) {
    return _then(_$_Task(
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      userId: userId == freezed
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String?,
      done: done == freezed
          ? _value.done
          : done // ignore: cast_nullable_to_non_nullable
              as bool?,
      doLater: doLater == freezed
          ? _value.doLater
          : doLater // ignore: cast_nullable_to_non_nullable
              as bool?,
      categoryId: categoryId == freezed
          ? _value.categoryId
          : categoryId // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$_Task implements _Task {
  _$_Task(
      {required this.name,
      @JsonKey(includeIfNull: false) this.id,
      @JsonKey(includeIfNull: false) this.userId,
      @JsonKey(includeIfNull: false) this.done,
      @JsonKey(includeIfNull: false) this.doLater,
      @JsonKey(includeIfNull: false) this.categoryId});

  factory _$_Task.fromJson(Map<String, dynamic> json) => _$$_TaskFromJson(json);

  @override
  final String name;
  @override
  @JsonKey(includeIfNull: false)
  final int? id;
  @override
  @JsonKey(includeIfNull: false)
  final String? userId;
  @override
  @JsonKey(includeIfNull: false)
  final bool? done;
  @override
  @JsonKey(includeIfNull: false)
  final bool? doLater;
  @override
  @JsonKey(includeIfNull: false)
  final int? categoryId;

  @override
  String toString() {
    return 'Task(name: $name, id: $id, userId: $userId, done: $done, doLater: $doLater, categoryId: $categoryId)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Task &&
            const DeepCollectionEquality().equals(other.name, name) &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.userId, userId) &&
            const DeepCollectionEquality().equals(other.done, done) &&
            const DeepCollectionEquality().equals(other.doLater, doLater) &&
            const DeepCollectionEquality()
                .equals(other.categoryId, categoryId));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(name),
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(userId),
      const DeepCollectionEquality().hash(done),
      const DeepCollectionEquality().hash(doLater),
      const DeepCollectionEquality().hash(categoryId));

  @JsonKey(ignore: true)
  @override
  _$$_TaskCopyWith<_$_Task> get copyWith =>
      __$$_TaskCopyWithImpl<_$_Task>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_TaskToJson(this);
  }
}

abstract class _Task implements Task {
  factory _Task(
      {required final String name,
      @JsonKey(includeIfNull: false) final int? id,
      @JsonKey(includeIfNull: false) final String? userId,
      @JsonKey(includeIfNull: false) final bool? done,
      @JsonKey(includeIfNull: false) final bool? doLater,
      @JsonKey(includeIfNull: false) final int? categoryId}) = _$_Task;

  factory _Task.fromJson(Map<String, dynamic> json) = _$_Task.fromJson;

  @override
  String get name => throw _privateConstructorUsedError;
  @override
  @JsonKey(includeIfNull: false)
  int? get id => throw _privateConstructorUsedError;
  @override
  @JsonKey(includeIfNull: false)
  String? get userId => throw _privateConstructorUsedError;
  @override
  @JsonKey(includeIfNull: false)
  bool? get done => throw _privateConstructorUsedError;
  @override
  @JsonKey(includeIfNull: false)
  bool? get doLater => throw _privateConstructorUsedError;
  @override
  @JsonKey(includeIfNull: false)
  int? get categoryId => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_TaskCopyWith<_$_Task> get copyWith => throw _privateConstructorUsedError;
}
