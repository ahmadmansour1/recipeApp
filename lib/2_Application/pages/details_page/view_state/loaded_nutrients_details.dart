import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:recipeapp/0_data/Models/Recipe.dart';


import '../../../component/Widgets/NutrientsListView.dart';
import '../../../component/Widgets/Tabs.dart';



class LoadedNutrientsDetails extends StatelessWidget {

  final Recipe recipe;
  const LoadedNutrientsDetails({Key? key , required this.recipe}) : super(key: key);

  @override
  Widget build(BuildContext context) {
      return Scaffold(
      appBar: AppBar( backgroundColor : Theme.of(context).primaryColor, title: Text('Nutrients Details') , automaticallyImplyLeading: false,),
      body: Column(
        children: [
          Flexible(
            child: SizedBox(
              width: double.infinity,
              child: Hero(
                tag: recipe.label!,
                child: recipe.image ==null ? const CircularProgressIndicator() : Image.network(
                  recipe.image!,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Tabs(recipe: recipe, currentWidgetIndex: 1,),
          Expanded(child: NutrientListView(recipe:recipe )),
        ],
      ),
    );
  }
}
