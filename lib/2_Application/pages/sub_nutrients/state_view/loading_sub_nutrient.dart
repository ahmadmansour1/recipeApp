import 'package:flutter/material.dart';

class LoadingSubNutrients extends StatelessWidget {
  const LoadingSubNutrients({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(child: CircularProgressIndicator(),);
  }
}
