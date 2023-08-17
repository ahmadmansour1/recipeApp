import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import '../../../../0_data/Models/Nutrientss.dart';
import '../../../../0_data/Models/Recipe.dart';




part 'sub_nutrients_state.dart';

class SubNutrientsCubit extends Cubit<SubNutrientsState> {
  SubNutrientsCubit() : super(SubNutrientsInitial());
  void loadSubNutrients  ( Recipe recipe ,  String nutrientLabel,final Digest digest){
    emit(SubNutrientsLoaded(recipe: recipe, digest: digest, nutrientLabel: nutrientLabel));
  }

}
