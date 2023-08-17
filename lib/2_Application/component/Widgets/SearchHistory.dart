import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class SearchHistory extends StatelessWidget {
  final Function() getQuery;
  String query;
  final bool showHistory;
  final List<String> searchHistory;
  SearchHistory({required this.query, required this.getQuery, required this.showHistory, required this.searchHistory}) : super();

  List<String> getSearchHistory(String query) {
    if (query.isEmpty) {
      return [];
    } else {
      return searchHistory
          .where((item) => item.toLowerCase().startsWith(query.toLowerCase()))
          .toList();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible:  showHistory && query.isNotEmpty && getSearchHistory(query).isNotEmpty,
      child: Container(
        width: 250,
        margin: const EdgeInsets.only(top: 60),
        padding: const EdgeInsets.symmetric(horizontal: 10),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
        ),
        child: ListView.builder(
          itemCount: getSearchHistory(query).length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(getSearchHistory(query)[index]),
              onTap: () {
                query = getSearchHistory(query)[index];
               getQuery();
              },
            );
          },
        ),
      ),
    );
  }
}
