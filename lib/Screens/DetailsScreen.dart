import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:recipeapp/Models/Recipe.dart';
import 'package:recipeapp/Widgets/Tabs.dart';

class DetailsScreen extends StatelessWidget {
  final Recipe recipe;
  const DetailsScreen({Key? key, required this.recipe}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        title: Text(recipe.label!),
      ),
      body: Column(
        children: [

          SizedBox(
            width: double.infinity,
            child: Hero(
              tag: recipe.label!,
              child: Image.network(
                recipe.image!,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Tabs(recipe: recipe, currentWidgetIndex: 0,),


          Flexible(
            child: ListView.builder(
              itemCount: recipe.ingredientLines?.length ?? 0,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(
                    recipe.ingredientLines![index],
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                );
              },
            ),
          ),



        ],
      ),
    );
  }
}
