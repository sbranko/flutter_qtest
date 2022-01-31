// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'car.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Car _$CarFromJson(Map<String, dynamic> json) {
  return _Car.fromJson(json);
}

/// @nodoc
class _$CarTearOff {
  const _$CarTearOff();

  _Car call(
      {required String color,
      required String maker,
      required String model,
      required int topSpeed}) {
    return _Car(
      color: color,
      maker: maker,
      model: model,
      topSpeed: topSpeed,
    );
  }

  Car fromJson(Map<String, Object?> json) {
    return Car.fromJson(json);
  }
}

/// @nodoc
const $Car = _$CarTearOff();

/// @nodoc
mixin _$Car {
  String get color => throw _privateConstructorUsedError;
  String get maker => throw _privateConstructorUsedError;
  String get model => throw _privateConstructorUsedError;
  int get topSpeed => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CarCopyWith<Car> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CarCopyWith<$Res> {
  factory $CarCopyWith(Car value, $Res Function(Car) then) =
      _$CarCopyWithImpl<$Res>;
  $Res call({String color, String maker, String model, int topSpeed});
}

/// @nodoc
class _$CarCopyWithImpl<$Res> implements $CarCopyWith<$Res> {
  _$CarCopyWithImpl(this._value, this._then);

  final Car _value;
  // ignore: unused_field
  final $Res Function(Car) _then;

  @override
  $Res call({
    Object? color = freezed,
    Object? maker = freezed,
    Object? model = freezed,
    Object? topSpeed = freezed,
  }) {
    return _then(_value.copyWith(
      color: color == freezed
          ? _value.color
          : color // ignore: cast_nullable_to_non_nullable
              as String,
      maker: maker == freezed
          ? _value.maker
          : maker // ignore: cast_nullable_to_non_nullable
              as String,
      model: model == freezed
          ? _value.model
          : model // ignore: cast_nullable_to_non_nullable
              as String,
      topSpeed: topSpeed == freezed
          ? _value.topSpeed
          : topSpeed // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
abstract class _$CarCopyWith<$Res> implements $CarCopyWith<$Res> {
  factory _$CarCopyWith(_Car value, $Res Function(_Car) then) =
      __$CarCopyWithImpl<$Res>;
  @override
  $Res call({String color, String maker, String model, int topSpeed});
}

/// @nodoc
class __$CarCopyWithImpl<$Res> extends _$CarCopyWithImpl<$Res>
    implements _$CarCopyWith<$Res> {
  __$CarCopyWithImpl(_Car _value, $Res Function(_Car) _then)
      : super(_value, (v) => _then(v as _Car));

  @override
  _Car get _value => super._value as _Car;

  @override
  $Res call({
    Object? color = freezed,
    Object? maker = freezed,
    Object? model = freezed,
    Object? topSpeed = freezed,
  }) {
    return _then(_Car(
      color: color == freezed
          ? _value.color
          : color // ignore: cast_nullable_to_non_nullable
              as String,
      maker: maker == freezed
          ? _value.maker
          : maker // ignore: cast_nullable_to_non_nullable
              as String,
      model: model == freezed
          ? _value.model
          : model // ignore: cast_nullable_to_non_nullable
              as String,
      topSpeed: topSpeed == freezed
          ? _value.topSpeed
          : topSpeed // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Car with DiagnosticableTreeMixin implements _Car {
  _$_Car(
      {required this.color,
      required this.maker,
      required this.model,
      required this.topSpeed});

  factory _$_Car.fromJson(Map<String, dynamic> json) => _$$_CarFromJson(json);

  @override
  final String color;
  @override
  final String maker;
  @override
  final String model;
  @override
  final int topSpeed;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'Car(color: $color, maker: $maker, model: $model, topSpeed: $topSpeed)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'Car'))
      ..add(DiagnosticsProperty('color', color))
      ..add(DiagnosticsProperty('maker', maker))
      ..add(DiagnosticsProperty('model', model))
      ..add(DiagnosticsProperty('topSpeed', topSpeed));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Car &&
            (identical(other.color, color) || other.color == color) &&
            (identical(other.maker, maker) || other.maker == maker) &&
            (identical(other.model, model) || other.model == model) &&
            (identical(other.topSpeed, topSpeed) ||
                other.topSpeed == topSpeed));
  }

  @override
  int get hashCode => Object.hash(runtimeType, color, maker, model, topSpeed);

  @JsonKey(ignore: true)
  @override
  _$CarCopyWith<_Car> get copyWith =>
      __$CarCopyWithImpl<_Car>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_CarToJson(this);
  }
}

abstract class _Car implements Car {
  factory _Car(
      {required String color,
      required String maker,
      required String model,
      required int topSpeed}) = _$_Car;

  factory _Car.fromJson(Map<String, dynamic> json) = _$_Car.fromJson;

  @override
  String get color;
  @override
  String get maker;
  @override
  String get model;
  @override
  int get topSpeed;
  @override
  @JsonKey(ignore: true)
  _$CarCopyWith<_Car> get copyWith => throw _privateConstructorUsedError;
}
