import 'package:flutter/material.dart';



import '../../../../0_data/Models/Recipe.dart';
import '../../../component/Widgets/GridItem.dart';


class LoadedRecipeView extends StatelessWidget {
  final String  query;
  List<Recipe> recipes = [];

   LoadedRecipeView({Key? key, required this.query , required this.recipes}) : super(key: key);
  @override
  Widget build(BuildContext context) {

    return  Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        title: recipes.isEmpty ? const Text('') : Text(query),
      ),
      body:  Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridItem(recipes: recipes),
      ),
    );
  }
}
