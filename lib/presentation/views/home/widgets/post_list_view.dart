import 'package:flutter/material.dart';

import '../../../../domain/entities/post_entity.dart';

class PostListView extends StatelessWidget {
  final List<PostEntity> posts;

  const PostListView({super.key, required this.posts});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: posts.length,
      padding: const EdgeInsets.all(12),
      separatorBuilder: (_, __) => const SizedBox(height: 8),
      itemBuilder: (context, index) {
        final post = posts[index];
        return Card(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          elevation: 2,
          child: ListTile(
            title: Text(post.title),
            subtitle: Text("ID: ${post.id} | User: ${post.userId}"),
          ),
        );
      },
    );
  }
}