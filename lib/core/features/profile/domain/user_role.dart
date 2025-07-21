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
