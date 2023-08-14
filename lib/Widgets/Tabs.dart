import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:recipeapp/Models/Nutrientss.dart';
import 'package:recipeapp/Models/Recipe.dart';
import 'package:recipeapp/Screens/DetailsScreen.dart';
import 'package:recipeapp/Screens/NutrientsDetails.dart';
import 'package:recipeapp/Screens/home.dart';

class Tabs extends StatefulWidget {
  final Recipe recipe;
  final int currentWidgetIndex;
  const Tabs({Key? key, required this.recipe , required this.currentWidgetIndex } ) : super(key: key);

  @override
  State<Tabs> createState() => _TabsState();
}

class _TabsState extends State<Tabs>{
  int _currentTabIndex = 0;

  @override
  void initState() {
    super.initState();
    _currentTabIndex = widget.currentWidgetIndex; // Use the currentTabIndex here
  }

  void _onTabTapped(int index) {
    setState(() {
      _currentTabIndex = index;
      if (index == 1) {
        // Navigate to NutrientsDetailsScreen and replace the current screen
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => NutrientsDetails(recipe: widget.recipe ),
          ),
        );
      } else {
        // Navigate to DetailsScreen and replace the current screen
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => DetailsScreen(recipe: widget.recipe),
          ),
        );
      }
    });

  }



  @override
  Widget build(BuildContext context) {
    return    DefaultTabController(
      length: 2,
      initialIndex: _currentTabIndex, // Start with the Ingredients tab
      child: Column(
          children: [
      TabBar(
        onTap: _onTabTapped,
      tabs: const  [
      Tab(text: 'Ingredients'),
      Tab(text: 'Nutrition'),
      ],
      labelColor: Colors.black,
    )
    ]
      ),
    );
  }
}



