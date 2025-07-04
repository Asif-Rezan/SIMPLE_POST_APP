import '../entities/post_entity.dart';
import '../repositories/local_post_repository.dart';

class AddLocalPostUseCase {
  final LocalPostRepository repository;

  AddLocalPostUseCase(this.repository);

  Future<void> call(PostEntity post) async => repository.addPost(post);
}

class UpdateLocalPostUseCase {
  final LocalPostRepository repository;

  UpdateLocalPostUseCase(this.repository);

  Future<void> call(int index, PostEntity post) async => repository.updatePost(index, post);
}

class DeleteLocalPostUseCase {
  final LocalPostRepository repository;

  DeleteLocalPostUseCase(this.repository);

  Future<void> call(int index) async => repository.deletePost(index);
}

class GetLocalPostsUseCase {
  final LocalPostRepository repository;

  GetLocalPostsUseCase(this.repository);

  Future<List<PostEntity>> call() async => repository.getLocalPosts();
}