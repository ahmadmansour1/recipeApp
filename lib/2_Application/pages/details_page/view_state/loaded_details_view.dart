import 'package:flutter/material.dart';

import '../../../../0_data/Models/Recipe.dart';
import '../../../component/Widgets/Tabs.dart';


class LoadedPageDetailsState extends StatelessWidget {
  final Recipe recipe;
  const LoadedPageDetailsState({Key? key , required this.recipe}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
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
              child: recipe.image ==null ?const  CircularProgressIndicator() :
              Image.network(
                recipe.image!,
                fit: BoxFit.cover,
              ),
            ),
          ),

          Tabs(recipe: recipe, currentWidgetIndex: 0,),


          Flexible(
            child: ListView.builder(
              scrollDirection: Axis.vertical,
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
