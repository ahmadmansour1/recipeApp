import 'package:recipeapp/1_domain/repositories/repositories.dart';

import '../0_data/Models/Recipe.dart';

class FetchRecipe {
 final Repositries repositries;

  FetchRecipe({required this.repositries});
 Future<List<Recipe>> getReciepe(String query) async {
   final result = repositries.getApiData(query);
   return result ;
 }


}