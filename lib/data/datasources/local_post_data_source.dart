import 'package:hive/hive.dart';

import '../models/post_model.dart';

abstract class LocalPostDataSource {
  Future<void> addPost(PostModel post);
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
  Future<List<PostModel>> getPosts() async {
    return box.values.cast<PostModel>().toList();
  }
}
