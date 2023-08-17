class Nutrient {
  String? label;
  String? tag;
  String? schemaOrgTag;
  double? total;
  bool? hasRDI;
  double? daily;
  String? unit;

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

  factory Nutrient.fromJson(Map<String, dynamic> json) {
    return Nutrient(
      label: json['label'],
      tag: json['tag'],
      schemaOrgTag: json['schemaOrgTag'],
      total: json['total']?.toDouble(),
      hasRDI: json['hasRDI'],
      daily: json['daily']?.toDouble(),
      unit: json['unit'],
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
    return data;
  }
}
