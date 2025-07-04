import '../entities/post_entity.dart';

abstract class LocalPostRepository {
  Future<void> addPost(PostEntity post);
  Future<void> updatePost(int index, PostEntity post);
  Future<void> deletePost(int index);
  Future<List<PostEntity>> getLocalPosts();
}