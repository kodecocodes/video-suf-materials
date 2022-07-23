// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'user.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

TodayUser _$TodayUserFromJson(Map<String, dynamic> json) {
  return _TodayUser.fromJson(json);
}

/// @nodoc
mixin _$TodayUser {
  String get email => throw _privateConstructorUsedError;
  String? get password => throw _privateConstructorUsedError;
  String? get userId => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TodayUserCopyWith<TodayUser> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TodayUserCopyWith<$Res> {
  factory $TodayUserCopyWith(TodayUser value, $Res Function(TodayUser) then) =
      _$TodayUserCopyWithImpl<$Res>;
  $Res call({String email, String? password, String? userId});
}

/// @nodoc
class _$TodayUserCopyWithImpl<$Res> implements $TodayUserCopyWith<$Res> {
  _$TodayUserCopyWithImpl(this._value, this._then);

  final TodayUser _value;
  // ignore: unused_field
  final $Res Function(TodayUser) _then;

  @override
  $Res call({
    Object? email = freezed,
    Object? password = freezed,
    Object? userId = freezed,
  }) {
    return _then(_value.copyWith(
      email: email == freezed
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      password: password == freezed
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String?,
      userId: userId == freezed
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
abstract class _$$_TodayUserCopyWith<$Res> implements $TodayUserCopyWith<$Res> {
  factory _$$_TodayUserCopyWith(
          _$_TodayUser value, $Res Function(_$_TodayUser) then) =
      __$$_TodayUserCopyWithImpl<$Res>;
  @override
  $Res call({String email, String? password, String? userId});
}

/// @nodoc
class __$$_TodayUserCopyWithImpl<$Res> extends _$TodayUserCopyWithImpl<$Res>
    implements _$$_TodayUserCopyWith<$Res> {
  __$$_TodayUserCopyWithImpl(
      _$_TodayUser _value, $Res Function(_$_TodayUser) _then)
      : super(_value, (v) => _then(v as _$_TodayUser));

  @override
  _$_TodayUser get _value => super._value as _$_TodayUser;

  @override
  $Res call({
    Object? email = freezed,
    Object? password = freezed,
    Object? userId = freezed,
  }) {
    return _then(_$_TodayUser(
      email: email == freezed
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      password: password == freezed
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String?,
      userId: userId == freezed
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_TodayUser implements _TodayUser {
  const _$_TodayUser(
      {required this.email, required this.password, this.userId});

  factory _$_TodayUser.fromJson(Map<String, dynamic> json) =>
      _$$_TodayUserFromJson(json);

  @override
  final String email;
  @override
  final String? password;
  @override
  final String? userId;

  @override
  String toString() {
    return 'TodayUser(email: $email, password: $password, userId: $userId)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_TodayUser &&
            const DeepCollectionEquality().equals(other.email, email) &&
            const DeepCollectionEquality().equals(other.password, password) &&
            const DeepCollectionEquality().equals(other.userId, userId));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(email),
      const DeepCollectionEquality().hash(password),
      const DeepCollectionEquality().hash(userId));

  @JsonKey(ignore: true)
  @override
  _$$_TodayUserCopyWith<_$_TodayUser> get copyWith =>
      __$$_TodayUserCopyWithImpl<_$_TodayUser>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_TodayUserToJson(this);
  }
}

abstract class _TodayUser implements TodayUser {
  const factory _TodayUser(
      {required final String email,
      required final String? password,
      final String? userId}) = _$_TodayUser;

  factory _TodayUser.fromJson(Map<String, dynamic> json) =
      _$_TodayUser.fromJson;

  @override
  String get email => throw _privateConstructorUsedError;
  @override
  String? get password => throw _privateConstructorUsedError;
  @override
  String? get userId => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_TodayUserCopyWith<_$_TodayUser> get copyWith =>
      throw _privateConstructorUsedError;
}
