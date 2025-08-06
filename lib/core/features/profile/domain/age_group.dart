enum AgeGroup { under18, over55, other }

extension AgeGroupDisplayName on AgeGroup {
  String get displayName {
    return switch (this) {
      AgeGroup.over55 => 'Over 55',
      AgeGroup.under18 => 'Under 18',
      AgeGroup.other => 'Other',
    };
  }
}
