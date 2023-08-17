import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recipeapp/2_Application/pages/recipe_view/cubit/recipe_view_page_cubit.dart';


import 'package:flutter_gen/gen_l10n/app_localizations.dart';


import '../../../0_data/Models/Recipe.dart';
import '../../component/Widgets/SearchHistory.dart';
import '../recipe_view/recipe_page.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

List<Recipe> recipes = [];
class _HomeScreenState extends State<HomeScreen> {
  List<String> searchHistory = [];
  final TextEditingController _QueryController = TextEditingController();
  bool showHistory = false;

  getQuery() async {
    if (_QueryController.text.isNotEmpty) {
      String query = _QueryController.text;
      setState(() {
        if (!searchHistory.contains(query)) {
          searchHistory.insert(0, query);
        } else {
          searchHistory.remove(query);
          searchHistory.insert(0, query);
        }
      });
      BlocProvider.of<RecipeViewPageCubit>(context).fetchData(query);
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (ctx) => RecipeView(query: query),
        ),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Search for a recipe')),
      );
    }
  }

  void clearTextField() {
    _QueryController.clear();
    setState(() {
      showHistory = false ;
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        title: Text(AppLocalizations.of(context).recipe),
      ),
      body: GestureDetector(
        onTap: (){
          setState(() {
            showHistory =false ;
          });
        },
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Stack(
            children: [
              Column(
                children: [

                  Container(
                    width: double.infinity,
                    height: 60,
                    margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          child: TextField(
                            controller: _QueryController,
                            decoration: InputDecoration(
                              hintText: AppLocalizations.of(context).search,
                              border: InputBorder.none,
                            ),
                            onChanged: (value) {
                              setState(() {
                                showHistory = true;
                              });
                            },
                            onSubmitted: (_) {
                              getQuery();
                              clearTextField();

                            },
                          ),
                        ),
                        const SizedBox(width: 20),
                        IconButton(
                          onPressed: () {
                            getQuery();
                            setState(() {
                              clearTextField();
                            });

                          },
                          icon: const Icon(Icons.search),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 100),
                  Column(
                    children: [
                      Center(
                        child: Text(
                          AppLocalizations.of(context).cook_with_us,
                          style: Theme.of(context).textTheme.headlineLarge,
                        ),
                      ),
                      Text(
                        AppLocalizations.of(context).find_best_recipe,
                        style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                      ),
                    ],
                  ),
                ],
              ),
          SearchHistory(query: _QueryController.text, getQuery:
            getQuery, showHistory: showHistory, searchHistory: searchHistory,)
            ],
          ),
        ),
      ),
    );
  }
}

