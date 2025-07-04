import 'package:flutter/material.dart';
import '../../../domain/entities/post_entity.dart';
import '../../../domain/usecases/add_local_post_use_case.dart';

class AddPostViewModel extends ChangeNotifier {
  final AddLocalPostUseCase _addPostUseCase;
  final GetLocalPostsUseCase _getPostsUseCase;

  AddPostViewModel(this._addPostUseCase, this._getPostsUseCase);

  final TextEditingController titleController = TextEditingController();
  final TextEditingController bodyController = TextEditingController();

  List<PostEntity> _posts = [];
  List<PostEntity> get posts => _posts;

  Future<void> loadPosts() async {
    _posts = await _getPostsUseCase();
    notifyListeners();
  }

  Future<void> addPost() async {
    final newPost = PostEntity(
      userId: 0,
      id: DateTime.now().millisecondsSinceEpoch,
      title: titleController.text,
      body: bodyController.text,
    );
    await _addPostUseCase(newPost);
    await loadPosts();

    titleController.clear();
    bodyController.clear();
  }
}
