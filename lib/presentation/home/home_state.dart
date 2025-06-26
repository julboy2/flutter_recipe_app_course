import 'package:freezed_annotation/freezed_annotation.dart';


part 'home_state.freezed.dart';

@freezed
class HomeState with _$HomeState {
  @override
  final List<String> categories;
  @override
  final String selectedCategory;

  const HomeState({
    this.categories = const [],
    this.selectedCategory = "All",

  });

}
