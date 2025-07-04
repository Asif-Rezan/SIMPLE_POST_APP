import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../viewmodels/home/home_viewmodel.dart';
import '../widgets/post_list_view.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Home")),
      body: Consumer<HomeViewModel>(
        builder: (context, viewModel, child) {
          return RefreshIndicator(
            onRefresh: viewModel.refresh,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: TextField(
                    decoration: const InputDecoration(
                      hintText: 'Search by title',
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(Icons.search),
                    ),
                    onChanged: viewModel.updateSearch, // ✅ fixed
                  ),
                ),
                if (viewModel.isLoading)
                  const Expanded(
                    child: Center(child: CircularProgressIndicator()),
                  )
                else ...[
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text('Total: ${viewModel.filteredPosts.length} items'),
                    ),
                  ),
                  const SizedBox(height: 8),
                  Expanded(
                    child: PostListView(posts: viewModel.filteredPosts),
                  ),
                ]
              ],
            ),
          );
        },
      ),
    );
  }
}
