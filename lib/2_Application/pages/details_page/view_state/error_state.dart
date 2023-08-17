import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ErrorPageDetails extends StatelessWidget {
  const ErrorPageDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
       return const ListTile(
      title: Text('cant be loaded'),
      leading: Icon(Icons.warning_rounded),
    );
  }
}
