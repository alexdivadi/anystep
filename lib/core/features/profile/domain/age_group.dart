enum AgeGroup { under18, over55, other }

extension AgeGroupDisplayName on AgeGroup {
  String get displayName {
    switch (this) {
      case AgeGroup.over55:
        return 'Over 55';
      case AgeGroup.under18:
        return 'Under 18';
      case AgeGroup.other:
        return 'Other';
    }
  }
}
