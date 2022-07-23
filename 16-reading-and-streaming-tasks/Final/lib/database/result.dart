import 'package:freezed_annotation/freezed_annotation.dart';

part 'result.freezed.dart';

@freezed
class Result<T> with _$Result {
  const factory Result.success(T data) = _Success;
  const factory Result.failure(Error error) = _Failure;
  const factory Result.errorMessage(int code, String? message) = _ErrorMessage;
}
