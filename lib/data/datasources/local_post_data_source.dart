import 'package:hive/hive.dart';
import '../models/post_model.dart';

abstract class LocalPostDataSource {
  Future<void> addPost(PostModel post);
  Future<void> updatePost(int index, PostModel post);
  Future<void> deletePost(int index);
  Future<List<PostModel>> getPosts();
}

class LocalPostDataSourceImpl implements LocalPostDataSource {
  final Box box;

  LocalPostDataSourceImpl(this.box);

  @override
  Future<void> addPost(PostModel post) async {
    await box.add(post);
  }

  @override
  Future<void> updatePost(int index, PostModel post) async {
    await box.putAt(index, post);
  }

  @override
  Future<void> deletePost(int index) async {
    await box.deleteAt(index);
  }

  @override
  Future<List<PostModel>> getPosts() async {
    return box.values.cast<PostModel>().toList();
  }
}