import 'dart:convert';


import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;

import '../Models/Recipe.dart';
import '../Screens/home.dart';

class Api {
  static String appKey = '333c334257855618350d99834aa02adc';
  static String appId = '596ce320';

  static Future<List<Recipe>> getApiData(String query) async {
    final response = await http.get(Uri.parse(
        'https://api.edamam.com/api/recipes/v2?type=public&q=${query}&app_key=${appKey}&app_id=${appId}'));

    if (response.statusCode == 200) {
      final jsonData = jsonDecode(response.body) as Map<String, dynamic>;
      final data = jsonData['hits'] as List<dynamic>;

      List<Recipe> recipes = data.map((hit) => Recipe.fromJson(hit['recipe']))
          .toList();
      return recipes;
    } else {
      print('Error: ${response.statusCode}');
      return [];
    }
  }


// static Future<List<Recipe>> getApiDataa(String query) async {
//   final dio = Dio();
//
//   try {
//     final response = await dio.get(
//         'https://api.edamam.com/api/recipes/v2?type=public&q=${query}&app_key=${appKey}&app_id=${appId}'
//     );
//
//     if (response.statusCode == 200) {
//       final jsonData = response.data as Map<String, dynamic>;
//       final data = jsonData['hits'] as List<dynamic>;
//
//       List<Recipe> recipes =
//       data.map((hit) => Recipe.fromJson(hit['recipe'])).toList();
//       return recipes;
//     } else {
//       print('Error: ${response.statusCode}');
//       return [];
//     }
//   } catch (e) {
//     print('Error: $e');
//     return [];
//   }
// }


}
