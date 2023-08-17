import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:recipeapp/1_domain/repositories/repositories.dart';
import 'package:recipeapp/1_domain/usecase.dart';

import '../../../../0_data/Models/Recipe.dart';






part 'recipe_view_page_state.dart';

class RecipeViewPageCubit extends Cubit<RecipeViewPageState> {
  final FetchRecipe fetchRecipe;
  RecipeViewPageCubit({required this.fetchRecipe}) : super(RecipeViewPageLoading());

  List<Recipe> recipes = [];
  void fetchData(String query) async{
    emit(RecipeViewPageLoading());
    try{
      recipes =  await fetchRecipe.getReciepe(query);
      emit(RecipeViewPageLoaded(recipes: recipes));
    } catch (e){
      emit(RecipeViewPageError());
    }

  }
}
