import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:recipeapp/0_data/repo/data-rep.dart';
import 'package:recipeapp/2_Application/pages/home_page/home.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '1_domain/repositories/repositories.dart';
import '1_domain/usecase.dart';
import '2_Application/pages/recipe_view/cubit/recipe_view_page_cubit.dart';

void main() {
  final FetchRecipe fetchRecipe = FetchRecipe(repositries: DataRepositories()); // Use the FetchRecipe use case
  runApp(
    BlocProvider(
      create: (context) => RecipeViewPageCubit(fetchRecipe: fetchRecipe), // Pass the use case instance
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],


      supportedLocales:const  [
         Locale('en'),
         Locale('ar'),
      ],

      home: const HomeScreen(),
      theme: ThemeData(
          primaryColor: Colors.black54,

          textTheme: const  TextTheme(
          headlineLarge: TextStyle(fontWeight: FontWeight.bold),
          headlineMedium: TextStyle(fontWeight: FontWeight.normal),

        )
      ),

    );
  }
}
