import 'package:freezed_annotation/freezed_annotation.dart';

part 'user.freezed.dart';
part 'user.g.dart';

@freezed
class TodayUser with _$TodayUser {
  const factory TodayUser({
    required String email,
    required String? password,
    String? userId
  }) = _TodayUser;
  factory TodayUser.fromJson(Map<String, dynamic> json) =>
      _$TodayUserFromJson(json);
}