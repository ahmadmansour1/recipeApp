import '../../0_data/Models/Nutrientss.dart';


class Recipe {
  final String? uri;
  final String? label;
  final String? image;
  final String? source;
  final List<String>? ingredientLines;
  final double? calories;
  final List<Digest>? digest;

  Recipe({
    this.uri,
    this.label,
    this.image,
    this.source,
    this.ingredientLines,
    this.calories,
    this.digest,
  });

  Recipe copyWith({
    String? uri,
    String? label,
    String? image,
    String? source,
    List<String>? ingredientLines,
    double? calories,
    List<Digest>? digest,
  }) {
    return Recipe(
      uri: uri ?? this.uri,
      label: label ?? this.label,
      image: image ?? this.image,
      source: source ?? this.source,
      ingredientLines: ingredientLines ?? this.ingredientLines,
      calories: calories ?? this.calories,
      digest: digest ?? this.digest,
    );
  }
}