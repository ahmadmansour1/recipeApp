import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recipeapp/2_Application/pages/details_page/view_state/loaded_details_view.dart';
import 'package:recipeapp/2_Application/pages/details_page/view_state/loading_view.dart';


import '../../../0_data/Models/Recipe.dart';
import 'details_cubit/details_page_cubit.dart';
import 'view_state/error_state.dart';
class DetailsScreenProvider extends StatelessWidget {
  final Recipe recipe;

  const DetailsScreenProvider({Key? key , required this.recipe}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<DetailsPageCubit>(create: (context ) => DetailsPageCubit()..loadDetails(recipe) ,
      child: DetailsScreen(recipe: recipe));
  }
}

class DetailsScreen extends StatelessWidget {
  final Recipe recipe;
  const DetailsScreen({Key? key, required this.recipe}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DetailsPageCubit , DetailsPageState>(
        builder: (context , state){
          if(state is DetailsPageError){
            return const  ErrorPageDetails();
          }
          else if(state is DetailsPageLoaded){
            return LoadedPageDetailsState(recipe: state.recipe,);
          }
          else {
           return const LoadingPageDetailsState();
          }
        });

  }
}
