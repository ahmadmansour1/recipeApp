part of 'recipe_view_page_cubit.dart';

@immutable
abstract class RecipeViewPageState extends Equatable {
  @override
  List<Object?> get props => [];
}

class RecipeViewPageLoaded extends RecipeViewPageState {
  final List<Recipe> recipes;
  @override
  List<Object> get props => [recipes];


  RecipeViewPageLoaded({required this.recipes});

}

class RecipeViewPageLoading extends RecipeViewPageState {}

class RecipeViewPageError extends RecipeViewPageState {}
