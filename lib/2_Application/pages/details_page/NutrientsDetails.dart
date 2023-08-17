import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recipeapp/2_Application/pages/details_page/view_state/error_state.dart';
import 'package:recipeapp/2_Application/pages/details_page/view_state/loaded_nutrients_details.dart';
import 'package:recipeapp/2_Application/pages/details_page/view_state/loading_view.dart';


import '../../../0_data/Models/Recipe.dart';
import 'details_cubit/details_page_cubit.dart';
class NutrientsDetailsScreenProvider extends StatelessWidget {
  final Recipe recipe;

  const NutrientsDetailsScreenProvider({Key? key , required this.recipe}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<DetailsPageCubit>(create: (context ) => DetailsPageCubit()..loadedNutrientDetails(recipe),
        child: NutrientsDetails(recipe: recipe,));
  }
}

class NutrientsDetails extends StatefulWidget {
  final Recipe recipe ;
  const NutrientsDetails({Key? key, required this.recipe}) : super(key: key);
  @override
  State<NutrientsDetails> createState() => _NutrientsDetailsState();
}

class _NutrientsDetailsState extends State<NutrientsDetails> {

  @override
  Widget build(BuildContext context) {
      return BlocBuilder<DetailsPageCubit , DetailsPageState>(
        builder: (context , state){
          if(state is DetailsPageError){
            return const  ErrorPageDetails();
          }
          else if(state is NutrientsDetailsPageLoaded){
            return LoadedNutrientsDetails(recipe: state.recipe);
          }
          else {
            return const LoadingPageDetailsState();
          }
        });
  }
}

