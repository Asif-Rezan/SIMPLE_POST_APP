import 'package:flutter/material.dart';
import '../../../domain/entities/post_entity.dart';
import '../../../domain/usecases/get_posts_usecase.dart';

class HomeViewModel extends ChangeNotifier {
  final GetPostsUseCase _getPostsUseCase;

  HomeViewModel(this._getPostsUseCase) {
    fetchPosts();
  }

  List<PostEntity> _posts = [];
  List<PostEntity> get posts => _posts;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  String _search = '';
  String get search => _search;

  Future<void> fetchPosts() async {

    debugPrint("fetch post");

    _isLoading = true;
    notifyListeners();

    try {
      final data = await _getPostsUseCase();
      _posts = data;
    } catch (e) {
      // handle error
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  void updateSearch(String query) {
    _search = query;
    notifyListeners();
  }

  List<PostEntity> get filteredPosts {
    if (_search.isEmpty) return _posts;
    return _posts
        .where((post) =>
        post.title.toLowerCase().contains(_search.toLowerCase()))
        .toList();
  }

  Future<void> refresh() async {
    await fetchPosts();
  }
}

