// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'generic_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

GenericResponse _$GenericResponseFromJson(Map<String, dynamic> json) {
  return _GenericResponse.fromJson(json);
}

/// @nodoc
class _$GenericResponseTearOff {
  const _$GenericResponseTearOff();

  _GenericResponse call(
      {@JsonKey(name: 'Message') required String message,
      @JsonKey(name: 'Payload') dynamic? payload}) {
    return _GenericResponse(
      message: message,
      payload: payload,
    );
  }

  GenericResponse fromJson(Map<String, Object?> json) {
    return GenericResponse.fromJson(json);
  }
}

/// @nodoc
const $GenericResponse = _$GenericResponseTearOff();

/// @nodoc
mixin _$GenericResponse {
  @JsonKey(name: 'Message')
  String get message => throw _privateConstructorUsedError;
  @JsonKey(name: 'Payload')
  dynamic? get payload => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $GenericResponseCopyWith<GenericResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GenericResponseCopyWith<$Res> {
  factory $GenericResponseCopyWith(
          GenericResponse value, $Res Function(GenericResponse) then) =
      _$GenericResponseCopyWithImpl<$Res>;
  $Res call(
      {@JsonKey(name: 'Message') String message,
      @JsonKey(name: 'Payload') dynamic? payload});
}

/// @nodoc
class _$GenericResponseCopyWithImpl<$Res>
    implements $GenericResponseCopyWith<$Res> {
  _$GenericResponseCopyWithImpl(this._value, this._then);

  final GenericResponse _value;
  // ignore: unused_field
  final $Res Function(GenericResponse) _then;

  @override
  $Res call({
    Object? message = freezed,
    Object? payload = freezed,
  }) {
    return _then(_value.copyWith(
      message: message == freezed
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      payload: payload == freezed
          ? _value.payload
          : payload // ignore: cast_nullable_to_non_nullable
              as dynamic?,
    ));
  }
}

/// @nodoc
abstract class _$GenericResponseCopyWith<$Res>
    implements $GenericResponseCopyWith<$Res> {
  factory _$GenericResponseCopyWith(
          _GenericResponse value, $Res Function(_GenericResponse) then) =
      __$GenericResponseCopyWithImpl<$Res>;
  @override
  $Res call(
      {@JsonKey(name: 'Message') String message,
      @JsonKey(name: 'Payload') dynamic? payload});
}

/// @nodoc
class __$GenericResponseCopyWithImpl<$Res>
    extends _$GenericResponseCopyWithImpl<$Res>
    implements _$GenericResponseCopyWith<$Res> {
  __$GenericResponseCopyWithImpl(
      _GenericResponse _value, $Res Function(_GenericResponse) _then)
      : super(_value, (v) => _then(v as _GenericResponse));

  @override
  _GenericResponse get _value => super._value as _GenericResponse;

  @override
  $Res call({
    Object? message = freezed,
    Object? payload = freezed,
  }) {
    return _then(_GenericResponse(
      message: message == freezed
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      payload: payload == freezed
          ? _value.payload
          : payload // ignore: cast_nullable_to_non_nullable
              as dynamic?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_GenericResponse implements _GenericResponse {
  _$_GenericResponse(
      {@JsonKey(name: 'Message') required this.message,
      @JsonKey(name: 'Payload') this.payload});

  factory _$_GenericResponse.fromJson(Map<String, dynamic> json) =>
      _$$_GenericResponseFromJson(json);

  @override
  @JsonKey(name: 'Message')
  final String message;
  @override
  @JsonKey(name: 'Payload')
  final dynamic? payload;

  @override
  String toString() {
    return 'GenericResponse(message: $message, payload: $payload)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _GenericResponse &&
            (identical(other.message, message) || other.message == message) &&
            const DeepCollectionEquality().equals(other.payload, payload));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, message, const DeepCollectionEquality().hash(payload));

  @JsonKey(ignore: true)
  @override
  _$GenericResponseCopyWith<_GenericResponse> get copyWith =>
      __$GenericResponseCopyWithImpl<_GenericResponse>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_GenericResponseToJson(this);
  }
}

abstract class _GenericResponse implements GenericResponse {
  factory _GenericResponse(
      {@JsonKey(name: 'Message') required String message,
      @JsonKey(name: 'Payload') dynamic? payload}) = _$_GenericResponse;

  factory _GenericResponse.fromJson(Map<String, dynamic> json) =
      _$_GenericResponse.fromJson;

  @override
  @JsonKey(name: 'Message')
  String get message;
  @override
  @JsonKey(name: 'Payload')
  dynamic? get payload;
  @override
  @JsonKey(ignore: true)
  _$GenericResponseCopyWith<_GenericResponse> get copyWith =>
      throw _privateConstructorUsedError;
}
