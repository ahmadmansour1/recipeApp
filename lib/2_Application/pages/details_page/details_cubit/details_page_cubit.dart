import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';



import '../../../../0_data/Models/Recipe.dart';
import '../view_state/loaded_nutrients_details.dart';

part 'details_page_state.dart';

class DetailsPageCubit extends Cubit<DetailsPageState> {
  DetailsPageCubit() : super(DetailsPageInitial());

  void loadDetails(Recipe recipe) {
    emit(DetailsPageLoaded(recipe: recipe));
  }
  void loadedNutrientDetails(Recipe recipe){
    emit(NutrientsDetailsPageLoaded(recipe : recipe ));
  }

  void showError() {
    emit(DetailsPageError());
  }


}
