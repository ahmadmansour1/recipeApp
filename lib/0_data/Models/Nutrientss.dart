

import 'package:recipeapp/0_data/Models/subnutrients.dart';

class Digest {
  String? label;
  String? tag;
  String? schemaOrgTag;
  double? total;
  bool? hasRDI;
  double? daily;
  String? unit;
  List<Nutrient>? sub; // List of Nutrient objects

  Digest({
    this.label,
    this.tag,
    this.schemaOrgTag,
    this.total,
    this.hasRDI,
    this.daily,
    this.unit,
    this.sub,
  });

  factory Digest.fromJson(Map<String, dynamic> json) {
    return Digest(
      label: json['label'],
      tag: json['tag'],
      schemaOrgTag: json['schemaOrgTag'],
      total: json['total']?.toDouble(),
      hasRDI: json['hasRDI'],
      daily: json['daily']?.toDouble(),
      unit: json['unit'],
      sub: json['sub'] != null
          ? (json['sub'] as List).map((item) => Nutrient.fromJson(item)).toList()
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['label'] = label;
    data['tag'] = tag;
    data['schemaOrgTag'] = schemaOrgTag;
    data['total'] = total;
    data['hasRDI'] = hasRDI;
    data['daily'] = daily;
    data['unit'] = unit;
    // Convert sub list to JSON
    data['sub'] = sub?.map((item) => item.toJson()).toList();
    return data;
  }
}

