class Nutrient {
  final String? label;
  final String? tag;
  final String? schemaOrgTag;
  final double? total;
  final bool? hasRDI;
  final double? daily;
  final String? unit;

  Nutrient({
    this.label,
    this.tag,
    this.schemaOrgTag,
    this.total,
    this.hasRDI,
    this.daily,
    this.unit,
  });

  Nutrient copyWith({
    String? label,
    String? tag,
    String? schemaOrgTag,
    double? total,
    bool? hasRDI,
    double? daily,
    String? unit,
  }) {
    return Nutrient(
      label: label ?? this.label,
      tag: tag ?? this.tag,
      schemaOrgTag: schemaOrgTag ?? this.schemaOrgTag,
      total: total ?? this.total,
      hasRDI: hasRDI ?? this.hasRDI,
      daily: daily ?? this.daily,
      unit: unit ?? this.unit,
    );
  }
}
