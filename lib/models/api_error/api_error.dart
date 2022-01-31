import 'package:freezed_annotation/freezed_annotation.dart';

part 'api_error.freezed.dart';
part 'api_error.g.dart';

@freezed
class ApiError<T> with _$ApiError<T> {
  factory ApiError({
    @JsonKey(name: 'Message') required String message,
  }) = _ApiError<T>;

  factory ApiError.fromJson(Map<String, dynamic> json) => _$ApiErrorFromJson(json);
}
