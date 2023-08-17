part of 'sub_nutrients_cubit.dart';

@immutable
abstract class SubNutrientsState extends Equatable {
  @override
  List<Object?> get props => [];

}

class SubNutrientsInitial extends SubNutrientsState {}
class SubNutrientsLoading extends SubNutrientsState {}
class SubNutrientsLoaded extends SubNutrientsState {
  final Recipe recipe;
  final String nutrientLabel;
  final Digest digest ;
  SubNutrientsLoaded({required this.recipe , required this.digest , required this.nutrientLabel});
  List<Object?> get props => [recipe , digest , nutrientLabel];


}