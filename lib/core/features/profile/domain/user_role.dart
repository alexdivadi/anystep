enum UserRole { admin, volunteer, board }

extension UserRoleExtension on UserRole {
  String get displayName {
    switch (this) {
      case UserRole.admin:
        return 'Staff';
      case UserRole.board:
        return 'Board Member';
      case UserRole.volunteer:
        return 'Volunteer';
    }
  }
}

extension UserRolePermissions on UserRole {
  bool get canCreateEvent => switch (this) {
    UserRole.admin => true,
    UserRole.board => false,
    UserRole.volunteer => false,
  };

  bool get canEditEvent => switch (this) {
    UserRole.admin => true,
    UserRole.board => false,
    UserRole.volunteer => false,
  };

  bool get canDeleteEvent => switch (this) {
    UserRole.admin => true,
    UserRole.board => false,
    UserRole.volunteer => false,
  };

  bool get canViewPrivateEvents => switch (this) {
    UserRole.admin => true,
    UserRole.board => true,
    UserRole.volunteer => false,
  };
}
