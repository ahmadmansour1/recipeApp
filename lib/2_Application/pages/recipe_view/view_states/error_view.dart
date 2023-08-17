import 'package:flutter/material.dart';

class ErrorRecipe extends StatelessWidget {
  const ErrorRecipe({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const ListTile(
      title: Text('cant be loaded'),
      leading: Icon(Icons.warning_rounded),
    );
  }
}
