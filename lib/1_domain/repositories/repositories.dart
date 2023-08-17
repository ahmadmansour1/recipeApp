

import '../../0_data/Models/Recipe.dart';

abstract class Repositries {
  Future<List<Recipe>> getApiData(String query);
}