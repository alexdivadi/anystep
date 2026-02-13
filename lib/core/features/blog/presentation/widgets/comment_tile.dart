import 'package:anystep/core/features/blog/domain/models/blog_comment.dart';
import 'package:flutter/material.dart';

class BlogCommentTile extends StatelessWidget {
  const BlogCommentTile({super.key, required this.comment, this.onTap});

  final BlogCommentModel comment;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      leading: comment.isPinned ? const Icon(Icons.push_pin) : null,
      title: Text(comment.body),
    );
  }
}
