import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:recipeapp/Screens/DetailsScreen.dart';
import 'package:recipeapp/Models/Recipe.dart';

import '../Screens/home.dart';

class GridItem extends StatelessWidget {
  List <Recipe> recipes ;
   GridItem({Key? key , required this.recipes }) : super(key: key);



  @override
  Widget build(BuildContext context) {
    return  GridView.builder(
      itemCount: recipes.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 9.0,
        mainAxisSpacing: 9.0,
      ),
      itemBuilder: (BuildContext context, int index) {
        return GestureDetector(
          onTap: (){
            Navigator.of(context).push(MaterialPageRoute(builder:(context) => DetailsScreen(recipe:recipes[index])));
          },
          child: Container(
            decoration: BoxDecoration(
              color: Colors.grey[200],
              borderRadius: BorderRadius.circular(8.0),
            ),
            child: Stack(
              fit: StackFit.expand,
              children: [
                Hero(
                  tag: recipes[index].label!,
                  child: Image.network(
                    recipes[index].image!,
                    fit: BoxFit.cover, // Adjusts the image to cover the entire container
                  ),
                ),
                Positioned(
                  left: 0,
                  right: 0,
                  bottom: 0,
                  child: Container(
                    padding: const EdgeInsets.all(8.0),
                    color: Colors.black.withOpacity(0.6),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          recipes[index].label!,
                          style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                          ),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                        const SizedBox(height: 4),
                        Text(
                          'Ingredients: ${recipes[index].ingredientLines?.length ?? 0}',
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                          ),
                        ),
                        const SizedBox(height: 4,),
                        Text('Calories: ${recipes[index].calories?.toStringAsFixed(2) ?? "N/A"}' ,    style: const TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                        ),),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

