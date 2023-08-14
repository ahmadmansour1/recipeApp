import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:recipeapp/Models/Nutrientss.dart';
import 'package:recipeapp/Models/Recipe.dart';
import 'package:recipeapp/Screens/SubNutrient.dart';
import 'package:recipeapp/Widgets/Tabs.dart';
import 'package:recipeapp/Widgets/NutrientsListView.dart';

class NutrientsDetails extends StatefulWidget {


  final Recipe recipe ;


  const NutrientsDetails({Key? key, required this.recipe}) : super(key: key);

  @override
  State<NutrientsDetails> createState() => _NutrientsDetailsState();
}

class _NutrientsDetailsState extends State<NutrientsDetails> {
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
                tag: widget.recipe.label!,
                child: Image.network(
                  widget.recipe.image!,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Tabs(recipe: widget.recipe, currentWidgetIndex: 1,),
          Expanded(child: NutrientListView(reciepe: widget.recipe )),



        ],
      ),
    );
  }
}

