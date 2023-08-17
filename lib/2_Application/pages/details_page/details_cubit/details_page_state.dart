part of 'details_page_cubit.dart';

@immutable
abstract class DetailsPageState extends Equatable {
  List <Object?> get props => [];
}

class DetailsPageInitial extends DetailsPageState {}
class DetailsPageError extends DetailsPageState {}
class DetailsPageLoading extends DetailsPageState {}
class DetailsPageLoaded extends DetailsPageState {
  final Recipe recipe;
  DetailsPageLoaded({required this.recipe});
  List <Object?> get props => [recipe];
}
class NutrientsDetailsPageLoaded extends DetailsPageState {
  final Recipe recipe;
  NutrientsDetailsPageLoaded ({required this.recipe});
  List <Object?> get props => [recipe];
}

