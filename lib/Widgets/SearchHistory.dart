import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:recipeapp/Screens/RecipeView.dart';

class SearchHistory extends StatefulWidget {
  final Function() getQuery;
  String query;
  final bool showHistory;
  final List<String> searchHistory;
  SearchHistory({required this.query, required this.getQuery, required this.showHistory, required this.searchHistory}) : super();

  @override
  State<SearchHistory> createState() => _SearchHistoryState();
}

class _SearchHistoryState extends State<SearchHistory> {


  List<String> getSearchHistory(String query) {
    if (query.isEmpty) {
      return [];
    } else {
      return widget.searchHistory
          .where((item) => item.toLowerCase().startsWith(query.toLowerCase()))
          .toList();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible:  widget.showHistory && widget.query.isNotEmpty && getSearchHistory(widget.query).isNotEmpty,
      child: Container(
        width: 250,
        margin: const EdgeInsets.only(top: 60),
        padding: const EdgeInsets.symmetric(horizontal: 10),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
        ),
        child: ListView.builder(
          itemCount: getSearchHistory(widget.query).length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(getSearchHistory(widget.query)[index]),
              onTap: () {
                widget.query = getSearchHistory(widget.query)[index];
                widget.getQuery();
              },
            );
          },
        ),
      ),
    );
  }
}
