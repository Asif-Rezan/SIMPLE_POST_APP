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
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(
                      onPressed: viewModel.isEditing
                          ? () => viewModel.updatePost(viewModel.editingIndex)
                          : viewModel.addPost,
                      child: Text(viewModel.isEditing ? "Update Post" : "Add Post"),
                    ),
                    if (viewModel.isEditing)
                      ElevatedButton(
                        onPressed: () {
                          viewModel.titleController.clear();
                          viewModel.bodyController.clear();
                          viewModel.setEditingPost(-1); // Clear editing state
                          viewModel.notifyListeners();
                        },
                        child: const Text("Cancel"),
                      ),
                  ],
                ),
                const SizedBox(height: 20),
                Expanded(
                  child: ListView.builder(
                    itemCount: viewModel.posts.length,
                    itemBuilder: (context, index) {
                      final post = viewModel.posts[index];
                      return Card(
                        child: ListTile(
                          title: Text(post.title),
                          subtitle: Text(post.body),
                          trailing: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              IconButton(
                                icon: const Icon(Icons.edit),
                                onPressed: () => viewModel.setEditingPost(index),
                              ),
                              IconButton(
                                icon: const Icon(Icons.delete),
                                onPressed: () => viewModel.deletePost(index),
                              ),
                            ],
                          ),
                        ),
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