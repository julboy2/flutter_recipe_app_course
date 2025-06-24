class FilterState {
  final String time;
  final int rate;
  final String category;

  // FilterState.name(this.time, this.rate, this.category);
  const FilterState({
    required this.time,
    required this.rate,
    required this.category,
  });

  // freezed 로 만들수 도 있다.
  FilterState copyWith({String? time, int? rate, String? category}) {
    return FilterState(
      time: time ?? this.time,
      rate: rate ?? this.rate,
      category: category ?? this.category,
    );
  }
}
