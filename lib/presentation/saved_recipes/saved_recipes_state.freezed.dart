// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'saved_recipes_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$SavedRecipesState {

 List<Recipe> get recipes; bool get isLoading;
/// Create a copy of SavedRecipesState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SavedRecipesStateCopyWith<SavedRecipesState> get copyWith => _$SavedRecipesStateCopyWithImpl<SavedRecipesState>(this as SavedRecipesState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SavedRecipesState&&const DeepCollectionEquality().equals(other.recipes, recipes)&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(recipes),isLoading);

@override
String toString() {
  return 'SavedRecipesState(recipes: $recipes, isLoading: $isLoading)';
}


}

/// @nodoc
abstract mixin class $SavedRecipesStateCopyWith<$Res>  {
  factory $SavedRecipesStateCopyWith(SavedRecipesState value, $Res Function(SavedRecipesState) _then) = _$SavedRecipesStateCopyWithImpl;
@useResult
$Res call({
 List<Recipe> recipes, bool isLoading
});




}
/// @nodoc
class _$SavedRecipesStateCopyWithImpl<$Res>
    implements $SavedRecipesStateCopyWith<$Res> {
  _$SavedRecipesStateCopyWithImpl(this._self, this._then);

  final SavedRecipesState _self;
  final $Res Function(SavedRecipesState) _then;

/// Create a copy of SavedRecipesState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? recipes = null,Object? isLoading = null,}) {
  return _then(SavedRecipesState(
recipes: null == recipes ? _self.recipes : recipes // ignore: cast_nullable_to_non_nullable
as List<Recipe>,isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


// dart format on
