enum UserRole { admin, volunteer }

extension UserRoleExtension on UserRole {
  String get displayName {
    switch (this) {
      case UserRole.admin:
        return 'Admin';
      case UserRole.volunteer:
        return 'Volunteer';
    }
  }
}

extension UserRolePermissions on UserRole {
  bool get canCreateEvent => switch (this) {
    UserRole.admin => true,
    UserRole.volunteer => false,
  };

  bool get canEditEvent => switch (this) {
    UserRole.admin => true,
    UserRole.volunteer => false,
  };

  bool get canDeleteEvent => switch (this) {
    UserRole.admin => true,
    UserRole.volunteer => false,
  };
}
