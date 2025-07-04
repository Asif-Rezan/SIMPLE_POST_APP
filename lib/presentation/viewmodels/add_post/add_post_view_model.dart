import 'package:flutter/material.dart';
import '../../../domain/entities/post_entity.dart';
import '../../../domain/usecases/add_local_post_use_case.dart';

class AddPostViewModel extends ChangeNotifier {
  final AddLocalPostUseCase _addPostUseCase;
  final UpdateLocalPostUseCase _updatePostUseCase;
  final DeleteLocalPostUseCase _deletePostUseCase;
  final GetLocalPostsUseCase _getPostsUseCase;

  AddPostViewModel(
    this._addPostUseCase,
    this._updatePostUseCase,
    this._deletePostUseCase,
    this._getPostsUseCase,
  ) {
    loadPosts();
  }

  final TextEditingController titleController = TextEditingController();
  final TextEditingController bodyController = TextEditingController();
  int? _editingIndex;

  List<PostEntity> _posts = [];

  List<PostEntity> get posts => _posts;

  int get editingIndex => _editingIndex!;

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
    _editingIndex = null;
    notifyListeners();
  }

  Future<void> updatePost(int index) async {
    final updatedPost = PostEntity(
      userId: 0,
      id: _posts[index].id,
      title: titleController.text,
      body: bodyController.text,
    );
    await _updatePostUseCase(index, updatedPost);
    await loadPosts();

    titleController.clear();
    bodyController.clear();
    _editingIndex = null;
    notifyListeners();
  }

  Future<void> deletePost(int index) async {
    await _deletePostUseCase(index);
    await loadPosts();
    notifyListeners();
  }

  void setEditingPost(int index) {
    _editingIndex = index;
    titleController.text = _posts[index].title;
    bodyController.text = _posts[index].body;
    notifyListeners();
  }

  bool get isEditing => _editingIndex != null;
}
