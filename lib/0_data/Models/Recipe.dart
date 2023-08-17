



import 'Nutrientss.dart';

class Recipe {
  String? uri;
  String? label;
  String? image;
  String? source;
  List<String>? ingredientLines;
  double? calories;

  List<Digest>? digest;

  Recipe( {
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

  Recipe.fromJson(Map<String, dynamic> json) {
    uri = json['uri'];
    label = json['label'];
    image = json['image'];
    source = json['source'];
    if (json['ingredientLines'] != null) {
      ingredientLines = List<String>.from(json['ingredientLines']);
    }
    calories = json['calories']!.toDouble();

    digest =  json['digest'] != null
        ? (json['digest'] as List).map((item) => Digest.fromJson(item)).toList()
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['uri'] = uri;
    data['label'] = label;
    data['image'] = image;
    data['source'] = source;
    if (ingredientLines != null) {
      data['ingredientLines'] = ingredientLines;
    }
    data['calories'] = calories;
    if (digest != null) {
      data['digest'] = digest!.map((item) => item.toJson()).toList();
    }
    return data;
  }
}
