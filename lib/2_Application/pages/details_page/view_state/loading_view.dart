import 'package:flutter/material.dart';

class LoadingPageDetailsState extends StatelessWidget {
  const LoadingPageDetailsState({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(child: CircularProgressIndicator(),);
  }
}
