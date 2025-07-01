/*
freezed 로 다시 만든다.
copyWith 같은 함수를 추가하려니 해당 관계있는 클래스를 다 수정해줘야되서 다시 freezed 로 만든다.

class Ingredient {
  final int id;
  final String name;
  final String image;

  Ingredient({
    required this.id,
    required this.name,
    required this.image,
  });

  factory Ingredient.fromJson(Map<String, dynamic> json) {
    return Ingredient(
      id: json['id'] as int,
      name: json['name'] as String,
      image: json['image'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'image': image,
    };
  }

  @override
  String toString() {
    return 'Ingredient(id: $id, name: $name, image: $image)';
  }
}
 */

import 'package:freezed_annotation/freezed_annotation.dart';

part "ingredient.freezed.dart";
part "ingredient.g.dart";

// @freezed
// class Ingredient with _$Ingredient {
//   // const factory Ingredient({
//   //   required int id,
//   //   required String name,
//   //   required String image,
//   // }) = _Ingredient;
//
//   final int id;
//   final String name;
//   final String image;
//
//   const Ingredient({this.id = 0, this.name = "", this.image = ""});
//
//   factory Ingredient.fromJson(Map<String, Object?> json) =>
//       _$IngredientFromJson(json);
// }
@freezed
class Ingredient with _$Ingredient {
  // const factory Ingredient({
  //   required int id,
  //   required String name,
  //   required String image,
  // }) = _Ingredient;

  @override
  final int id;
  @override
  final String name;
  @override
  final String image;

  const Ingredient({this.id = 0, this.name = "", this.image = ""});

  factory Ingredient.fromJson(Map<String, Object?> json) => _$IngredientFromJson(json);

  @override
  Map<String, dynamic> toJson() {
    // TODO: implement toJson
    throw UnimplementedError();
  }


}