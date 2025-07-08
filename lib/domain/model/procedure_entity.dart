import 'package:freezed_annotation/freezed_annotation.dart';

part 'procedure_entity.freezed.dart';

part 'procedure_entity.g.dart';

// ignore_for_file: annotate_overrides
@freezed
@JsonSerializable() // fromJson 추가시 꼭 명시적으로 적어줘야됨 3.x 부터
class ProcedureEntity with _$ProcedureEntity {
  final int recipeId;
  final int step;
  final String content;

  const ProcedureEntity({
    required this.recipeId,
    required this.step,
    required this.content,
  });

  factory ProcedureEntity.fromJson(Map<String, dynamic> json) =>
      _$ProcedureEntityFromJson(json);

  @override
  Map<String, dynamic> toJson() {
    // TODO: implement toJson
    throw UnimplementedError();
  }

  // Map<String, dynamic> toJson() => _$ProcedureEntityToJson(this);


}
