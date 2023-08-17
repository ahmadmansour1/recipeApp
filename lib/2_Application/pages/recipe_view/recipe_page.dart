import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recipeapp/2_Application/pages/recipe_view/view_states/error_view.dart';
import 'package:recipeapp/2_Application/pages/recipe_view/view_states/loaded_view.dart';
import 'package:recipeapp/2_Application/pages/recipe_view/view_states/loading_view.dart';

import '../../../0_data/repo/data-rep.dart';
import '../../../1_domain/usecase.dart';
import 'cubit/recipe_view_page_cubit.dart';



class RecipeViewProvider extends StatelessWidget {
  const RecipeViewProvider({Key? key, required this.query}) : super(key: key);
  final String query;

  @override
  Widget build(BuildContext context) {
    final FetchRecipe fetchRecipe = FetchRecipe(repositries: DataRepositories()); // Create the FetchRecipe use case

    return BlocProvider<RecipeViewPageCubit>(
      create: (context) => RecipeViewPageCubit(fetchRecipe: fetchRecipe), // Use the FetchRecipe use case
      child: RecipeView(query: query),
    );
  }
}

class RecipeView extends StatelessWidget {
  final String query;
  const RecipeView({Key? key , required this.query}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    context.read<RecipeViewPageCubit>().fetchData(query);
   // recipeCubit.fetchData(query);
    return BlocBuilder<RecipeViewPageCubit, RecipeViewPageState>
      (builder: (context , state){
        if(state is  RecipeViewPageLoading){
          return const LoadingRecipe();
        }
        else if(state is RecipeViewPageLoaded ){
          return LoadedRecipeView(query: query, recipes: state.recipes);
        }
        else {
          return const ErrorRecipe();
        }
    });
  }
}


