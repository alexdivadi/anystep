import 'package:anystep/core/features/profile/domain/user_model.dart';

String displayNameWithLastInitial(UserModel user) {
  final last = user.lastName.trim();
  if (last.isEmpty) {
    return user.firstName;
  }
  return '${user.firstName} ${last[0].toUpperCase()}.';
}
