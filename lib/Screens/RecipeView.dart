

import 'package:flutter/material.dart';

import 'package:recipeapp/Widgets/GridItem.dart';
import 'package:recipeapp/serveice/Apis.dart';
import 'package:recipeapp/Models/Recipe.dart';



class RecipeView extends StatefulWidget {
  final String  query;
  RecipeView({Key? key,  required this.query}) : super(key: key);

  @override
  State<RecipeView> createState() => _RecipeViewState();
}
class _RecipeViewState extends State<RecipeView> {

   List<Recipe> recipes = [];
   Future<void> _fetchData() async {
     try {
       final data = await Api.getApiData(widget.query);
       setState(() {
         recipes = data;
       });
       print('ok');
     } catch (e) {
       print('Error: $e');
     }
   }
  @override
  void initState() {
    super.initState();
    _fetchData();


  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        title: recipes.isEmpty ? const Text('') : Text(widget.query),
      ),
      body: recipes.isEmpty
          ? Center(
        child: CircularProgressIndicator(),
      )
          : Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridItem(recipes: recipes),
      ),
    );
  }
}

