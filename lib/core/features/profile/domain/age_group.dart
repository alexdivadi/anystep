enum AgeGroup { under18, over55, other }

extension AgeGroupDisplayName on AgeGroup {
  String get displayName => switch (this) {
    AgeGroup.over55 => 'Over 55',
    AgeGroup.under18 => 'Under 18',
    AgeGroup.other => 'Other',
  };
}

extension AgeGroupJson on AgeGroup {
  String get jsonValue => switch (this) {
    AgeGroup.over55 => 'over_55',
    AgeGroup.under18 => 'under_18',
    AgeGroup.other => 'other',
  };

  static AgeGroup fromJson(String value) {
    return AgeGroup.values.firstWhere(
      (ageGroup) => ageGroup.jsonValue == value,
      orElse: () => AgeGroup.other,
    );
  }

  String toJson() => jsonValue;
  static String toJsonStatic(AgeGroup ageGroup) => ageGroup.jsonValue;
}
