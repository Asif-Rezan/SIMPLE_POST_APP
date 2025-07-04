import '../entities/post_entity.dart';

abstract class LocalPostRepository {
  Future<void> addPost(PostEntity post);
  Future<List<PostEntity>> getLocalPosts();
}
