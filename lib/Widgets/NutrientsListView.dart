import 'package:flutter/material.dart';
import 'package:recipeapp/Models/Recipe.dart';
import 'package:recipeapp/Screens/SubNutrient.dart';

class NutrientListView extends StatelessWidget {
  final Recipe reciepe;

  // final Function(Nutrient) onTap;

  const NutrientListView({
    Key? key,
    required this.reciepe,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListView.builder(
        itemCount: reciepe.digest!.length,
        itemBuilder: (context, index) {
          return Column(
            children: [
              ListTile(
                  title: Text(reciepe.digest![index].label ?? ''),
                  subtitle: Text(
                      'daily :  ${reciepe.digest![index].total!.toStringAsFixed(2)}'),
                  onTap: () {
                    if (reciepe.digest![index].sub != null &&
                        reciepe.digest![index].sub!.isNotEmpty) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => SubNutrients(
                                  recipe: reciepe,
                                  nutrientLabel:
                                      reciepe.digest![index].label as String,
                                  digest: reciepe.digest![index],
                                )),
                      );
                    }
                  }),
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
