import '../model/procedure_entity.dart';

abstract interface class ProcedureRepository{
  Future<List<ProcedureEntity>> getProcedures();

  Future<List<ProcedureEntity>> getProceduresByRecipeId(int recipeId);
}