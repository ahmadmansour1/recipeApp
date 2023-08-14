import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:recipeapp/Models/Nutrientss.dart';
import 'package:recipeapp/Models/Recipe.dart';

class SubNutrients extends StatefulWidget {
  final Recipe recipe;
  final String nutrientLabel;
  final Digest digest ;

  const SubNutrients({Key? key, required this.recipe, required this.nutrientLabel, required this.digest}) : super(key: key);

  @override
  State<SubNutrients> createState() => _SubNutrientsState();
}

class _SubNutrientsState extends State<SubNutrients> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        title: Text(widget.nutrientLabel),
      ),
      body: ListView.builder(
        itemCount: widget.digest.sub?.length ,
        itemBuilder: (context, index) {
          if (widget.digest.sub![index] != null) {
            return Column(
              children: [
                ListTile(
                  title: Text(widget.digest.sub![index].label ?? ''),
                  subtitle: Text('Total: ${widget.digest.sub![index].total?.toStringAsFixed(2) ?? ''} ${widget.digest.sub![index].unit ?? ''}'),
                ),
                Divider(thickness: 2, height: 1,),
              ],
            );
          } else {
            return const Center(child: CircularProgressIndicator()) ;//
          }
        },
      ),
    );
  }
}
