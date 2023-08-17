import 'package:flutter/material.dart';
import 'package:recipeapp/1_domain/entity/digest_entity.dart';



import 'package:recipeapp/2_Application/pages/sub_nutrients/SubNutrient.dart';

import '../../../0_data/Models/Recipe.dart';

 // Update the import

class NutrientListView extends StatelessWidget {
  final Recipe recipe; // Update the variable name


  const NutrientListView({
    Key? key,
    required this.recipe,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListView.builder(
        itemCount: recipe.digest!.length, // Update variable references
        itemBuilder: (context, index) {
          return Column(
            children: [
              ListTile(
                title: Text(recipe.digest![index].label ?? ''),
                subtitle:
                Text('daily : ${recipe.digest![index].total!.toStringAsFixed(2)}'),
                onTap: () {
                  if (recipe.digest![index].sub != null &&
                      recipe.digest![index].sub!.isNotEmpty) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => SubNutrientsProvider(
                          recipe: recipe,
                          nutrientLabel: recipe.digest![index].label as String,
                          digest: recipe.digest![index],
                        ),
                      ),
                    );
                  }
                },
              ),
              const Divider(
                thickness: 1,
              ),
            ],
          );
        },
      ),
    );
  }
}
