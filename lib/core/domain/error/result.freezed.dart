// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'result.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$Result<D,E extends Error> {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Result<D, E>);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'Result<$D, $E>()';
}


}

/// @nodoc
class $ResultCopyWith<D,E extends Error,$Res>  {
$ResultCopyWith(Result<D, E> _, $Res Function(Result<D, E>) __);
}


/// @nodoc


class ResultSuccess<D,E extends Error> implements Result<D, E> {
  const ResultSuccess(this.data);
  

 final  D data;

/// Create a copy of Result
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ResultSuccessCopyWith<D, E, ResultSuccess<D, E>> get copyWith => _$ResultSuccessCopyWithImpl<D, E, ResultSuccess<D, E>>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ResultSuccess<D, E>&&const DeepCollectionEquality().equals(other.data, data));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(data));

@override
String toString() {
  return 'Result<$D, $E>.success(data: $data)';
}


}

/// @nodoc
abstract mixin class $ResultSuccessCopyWith<D,E extends Error,$Res> implements $ResultCopyWith<D, E, $Res> {
  factory $ResultSuccessCopyWith(ResultSuccess<D, E> value, $Res Function(ResultSuccess<D, E>) _then) = _$ResultSuccessCopyWithImpl;
@useResult
$Res call({
 D data
});




}
/// @nodoc
class _$ResultSuccessCopyWithImpl<D,E extends Error,$Res>
    implements $ResultSuccessCopyWith<D, E, $Res> {
  _$ResultSuccessCopyWithImpl(this._self, this._then);

  final ResultSuccess<D, E> _self;
  final $Res Function(ResultSuccess<D, E>) _then;

/// Create a copy of Result
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? data = freezed,}) {
  return _then(ResultSuccess<D, E>(
freezed == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as D,
  ));
}


}

/// @nodoc


class ResultError<D,E extends Error> implements Result<D, E> {
  const ResultError(this.error);
  

 final  E error;

/// Create a copy of Result
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ResultErrorCopyWith<D, E, ResultError<D, E>> get copyWith => _$ResultErrorCopyWithImpl<D, E, ResultError<D, E>>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ResultError<D, E>&&const DeepCollectionEquality().equals(other.error, error));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(error));

@override
String toString() {
  return 'Result<$D, $E>.error(error: $error)';
}


}

/// @nodoc
abstract mixin class $ResultErrorCopyWith<D,E extends Error,$Res> implements $ResultCopyWith<D, E, $Res> {
  factory $ResultErrorCopyWith(ResultError<D, E> value, $Res Function(ResultError<D, E>) _then) = _$ResultErrorCopyWithImpl;
@useResult
$Res call({
 E error
});




}
/// @nodoc
class _$ResultErrorCopyWithImpl<D,E extends Error,$Res>
    implements $ResultErrorCopyWith<D, E, $Res> {
  _$ResultErrorCopyWithImpl(this._self, this._then);

  final ResultError<D, E> _self;
  final $Res Function(ResultError<D, E>) _then;

/// Create a copy of Result
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? error = null,}) {
  return _then(ResultError<D, E>(
null == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as E,
  ));
}


}

// dart format on
