import '../../0_data/Models/subnutrients.dart';
// Import your Nutrient class here

class Digest {
  final String? label;
  final String? tag;
  final String? schemaOrgTag;
  final double? total;
  final bool? hasRDI;
  final double? daily;
  final String? unit;
  final List<Nutrient>? sub; // List of Nutrient objects

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

  Digest copyWith({
    String? label,
    String? tag,
    String? schemaOrgTag,
    double? total,
    bool? hasRDI,
    double? daily,
    String? unit,
    List<Nutrient>? sub,
  }) {
    return Digest(
      label: label ?? this.label,
      tag: tag ?? this.tag,
      schemaOrgTag: schemaOrgTag ?? this.schemaOrgTag,
      total: total ?? this.total,
      hasRDI: hasRDI ?? this.hasRDI,
      daily: daily ?? this.daily,
      unit: unit ?? this.unit,
      sub: sub ?? this.sub,
    );
  }
}
