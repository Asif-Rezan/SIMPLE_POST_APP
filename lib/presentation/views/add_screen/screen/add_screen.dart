import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../viewmodels/add_post/add_post_view_model.dart';

class AddScreen extends StatelessWidget {
  const AddScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Add Task")),
      body: Consumer<AddPostViewModel>(
        builder: (context, viewModel, child) {
          return Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                TextField(
                  controller: viewModel.titleController,
                  decoration: const InputDecoration(labelText: "Title"),
                ),
                const SizedBox(height: 12),
                TextField(
                  controller: viewModel.bodyController,
                  decoration: const InputDecoration(labelText: "Body"),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: viewModel.addPost,
                  child: const Text("Add Post"),
                ),
                const SizedBox(height: 20),
                Expanded(
                  child: ListView.builder(
                    itemCount: viewModel.posts.length,
                    itemBuilder: (context, index) {
                      final post = viewModel.posts[index];
                      return Card(
                        child: ListTile(title: Text(post.title)),
                      );
                    },
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
