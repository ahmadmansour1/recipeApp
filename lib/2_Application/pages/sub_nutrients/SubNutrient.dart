import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recipeapp/0_data/Models/Nutrientss.dart';

import 'package:recipeapp/2_Application/pages/sub_nutrients/state_view/loaded_sub_nutrients.dart';
import 'package:recipeapp/2_Application/pages/sub_nutrients/state_view/loading_sub_nutrient.dart';



import '../../../0_data/Models/Recipe.dart';
import 'cubit/sub_nutrients_cubit.dart';

class SubNutrientsProvider extends StatelessWidget {
  final Recipe recipe;
  final String nutrientLabel;
  final Digest digest ;
  const SubNutrientsProvider({Key? key , required this.recipe, required this.nutrientLabel, required this.digest}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<SubNutrientsCubit>(create:(context) => SubNutrientsCubit()..loadSubNutrients(recipe , nutrientLabel, digest),
    child: SubNutrients(recipe: recipe , nutrientLabel: nutrientLabel, digest: digest,),
    );
  }
}


class SubNutrients extends StatelessWidget {
  final Recipe recipe;
  final String nutrientLabel;
  final Digest digest;

  const SubNutrients(
      {Key? key, required this.recipe, required this.nutrientLabel, required this.digest})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SubNutrientsCubit, SubNutrientsState>(
        builder: (context, state) {
          if (state is SubNutrientsLoaded) {
            return LoadedSubNutrient(nutrientLabel: state.nutrientLabel,
              digest: state.digest,
              recipe: state.recipe,);
          }
          else {
            return LoadingSubNutrients();
          }
        });
  }
}

