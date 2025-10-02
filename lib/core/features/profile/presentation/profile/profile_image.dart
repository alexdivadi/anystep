import 'package:anystep/core/features/profile/domain/user_model.dart';
import 'package:flutter/material.dart';

class ProfileImage extends StatelessWidget {
  const ProfileImage({super.key, required this.user, this.size = 60});

  final UserModel user;
  final double size;

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: size,
      backgroundColor: Colors.grey,
      foregroundImage: user.profileImageUrl.isNotEmpty ? NetworkImage(user.profileImageUrl) : null,
      onForegroundImageError: (_, __) {
        // optional: debugPrint('Failed to load profile image: $__');
      },
      child: Icon(Icons.person, size: size, color: Theme.of(context).colorScheme.onSurfaceVariant),
    );
  }
}
