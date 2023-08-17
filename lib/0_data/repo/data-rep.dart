import 'package:recipeapp/0_data/Models/Recipe.dart';

import '../../1_domain/repositories/repositories.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class DataRepositories implements Repositries {
  @override
  String appKey = '333c334257855618350d99834aa02adc';
  String appId = '596ce320';

  Future<List<Recipe>> getApiData(String query) async {
    final response = await http.get(Uri.parse(
        'https://api.edamam.com/api/recipes/v2?type=public&q=${query}&app_key=${appKey}&app_id=${appId}'));

    try {
      if (response.statusCode == 200) {
        final jsonData = jsonDecode(response.body) as Map<String, dynamic>;
        final data = jsonData['hits'] as List<dynamic>;

        List<Recipe> recipes = data.map((hit) => Recipe.fromJson(hit['recipe']))
            .toList();
        return recipes;
      }
      else {

        print('Error: ${response.statusCode}');
        return []; // Return an empty list or another appropriate value
      }
    } catch (e) {
      print('Error: ${e}');
      return [];
    }

  }
}