import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:recipeapp/2_Application/pages/details_page/DetailsScreen.dart';
import 'package:recipeapp/2_Application/pages/details_page/NutrientsDetails.dart';

import '../../../0_data/Models/Recipe.dart';






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
            builder: (context) => NutrientsDetailsScreenProvider(recipe: widget.recipe ),
          ),
        );
      } else {
        // Navigate to DetailsScreen and replace the current screen
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => DetailsScreenProvider(recipe: widget.recipe),
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



