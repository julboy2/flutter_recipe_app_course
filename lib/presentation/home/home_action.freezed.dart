// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'home_action.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$HomeAction<T> {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is HomeAction<T>);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'HomeAction<$T>()';
}


}

/// @nodoc
class $HomeActionCopyWith<T,$Res>  {
$HomeActionCopyWith(HomeAction<T> _, $Res Function(HomeAction<T>) __);
}


/// @nodoc


class OnTapSearchField<T> implements HomeAction<T> {
  const OnTapSearchField();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OnTapSearchField<T>);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'HomeAction<$T>.onTapSearchField()';
}


}




/// @nodoc


class OnSelectCategory<T> implements HomeAction<T> {
  const OnSelectCategory(this.category);
  

 final  String category;

/// Create a copy of HomeAction
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$OnSelectCategoryCopyWith<T, OnSelectCategory<T>> get copyWith => _$OnSelectCategoryCopyWithImpl<T, OnSelectCategory<T>>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OnSelectCategory<T>&&(identical(other.category, category) || other.category == category));
}


@override
int get hashCode => Object.hash(runtimeType,category);

@override
String toString() {
  return 'HomeAction<$T>.onSelectCategory(category: $category)';
}


}

/// @nodoc
abstract mixin class $OnSelectCategoryCopyWith<T,$Res> implements $HomeActionCopyWith<T, $Res> {
  factory $OnSelectCategoryCopyWith(OnSelectCategory<T> value, $Res Function(OnSelectCategory<T>) _then) = _$OnSelectCategoryCopyWithImpl;
@useResult
$Res call({
 String category
});




}
/// @nodoc
class _$OnSelectCategoryCopyWithImpl<T,$Res>
    implements $OnSelectCategoryCopyWith<T, $Res> {
  _$OnSelectCategoryCopyWithImpl(this._self, this._then);

  final OnSelectCategory<T> _self;
  final $Res Function(OnSelectCategory<T>) _then;

/// Create a copy of HomeAction
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? category = null,}) {
  return _then(OnSelectCategory<T>(
null == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
