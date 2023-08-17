


import 'package:flutter/material.dart';

import '../../../../0_data/Models/Nutrientss.dart';
import '../../../../0_data/Models/Recipe.dart';



class LoadedSubNutrient extends StatelessWidget {
  final Recipe recipe;
  final String nutrientLabel;
  final Digest digest ;
  const LoadedSubNutrient({super.key ,required this.nutrientLabel , required this.digest ,required this.recipe}) ;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        title: Text(nutrientLabel),
      ),
      body: ListView.builder(
        itemCount: digest.sub?.length ,
        itemBuilder: (context, index) {
          if (digest.sub![index] != null) {
            return Column(
              children: [
                ListTile(
                  title: Text(digest.sub![index].label ?? ''),
                  subtitle: Text('Total: ${digest.sub![index].total?.toStringAsFixed(2) ?? ''} ${digest.sub![index].unit ?? ''}'),
                ),
                const  Divider(thickness: 2, height: 1,),
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
