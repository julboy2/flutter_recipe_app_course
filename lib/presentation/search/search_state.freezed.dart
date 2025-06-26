// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'search_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$SearchState {

 List<Recipe> get recipes; bool get isLoading; String get searchTitle; String get resultsCount; FilterState get filterState; String get query;
/// Create a copy of SearchState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SearchStateCopyWith<SearchState> get copyWith => _$SearchStateCopyWithImpl<SearchState>(this as SearchState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SearchState&&const DeepCollectionEquality().equals(other.recipes, recipes)&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.searchTitle, searchTitle) || other.searchTitle == searchTitle)&&(identical(other.resultsCount, resultsCount) || other.resultsCount == resultsCount)&&(identical(other.filterState, filterState) || other.filterState == filterState)&&(identical(other.query, query) || other.query == query));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(recipes),isLoading,searchTitle,resultsCount,filterState,query);

@override
String toString() {
  return 'SearchState(recipes: $recipes, isLoading: $isLoading, searchTitle: $searchTitle, resultsCount: $resultsCount, filterState: $filterState, query: $query)';
}


}

/// @nodoc
abstract mixin class $SearchStateCopyWith<$Res>  {
  factory $SearchStateCopyWith(SearchState value, $Res Function(SearchState) _then) = _$SearchStateCopyWithImpl;
@useResult
$Res call({
 List<Recipe> recipes, bool isLoading, String searchTitle, String resultsCount, FilterState filterState, String query
});




}
/// @nodoc
class _$SearchStateCopyWithImpl<$Res>
    implements $SearchStateCopyWith<$Res> {
  _$SearchStateCopyWithImpl(this._self, this._then);

  final SearchState _self;
  final $Res Function(SearchState) _then;

/// Create a copy of SearchState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? recipes = null,Object? isLoading = null,Object? searchTitle = null,Object? resultsCount = null,Object? filterState = null,Object? query = null,}) {
  return _then(SearchState(
recipes: null == recipes ? _self.recipes : recipes // ignore: cast_nullable_to_non_nullable
as List<Recipe>,isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,searchTitle: null == searchTitle ? _self.searchTitle : searchTitle // ignore: cast_nullable_to_non_nullable
as String,resultsCount: null == resultsCount ? _self.resultsCount : resultsCount // ignore: cast_nullable_to_non_nullable
as String,filterState: null == filterState ? _self.filterState : filterState // ignore: cast_nullable_to_non_nullable
as FilterState,query: null == query ? _self.query : query // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


// dart format on
