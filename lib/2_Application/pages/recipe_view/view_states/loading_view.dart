import 'package:flutter/material.dart';

class LoadingRecipe extends StatelessWidget {
  const LoadingRecipe({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(child: CircularProgressIndicator(),);
  }
}
