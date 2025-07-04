import '../entities/post_entity.dart';
import '../repositories/local_post_repository.dart';

class AddLocalPostUseCase {
  final LocalPostRepository repository;

  AddLocalPostUseCase(this.repository);

  Future<void> call(PostEntity post) async => repository.addPost(post);
}

class GetLocalPostsUseCase {
  final LocalPostRepository repository;

  GetLocalPostsUseCase(this.repository);

  Future<List<PostEntity>> call() async => repository.getLocalPosts();
}
