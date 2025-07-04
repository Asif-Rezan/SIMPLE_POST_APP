import '../../../domain/entities/post_entity.dart';
import '../../domain/repositories/local_post_repository.dart';
import '../datasources/local_post_data_source.dart';
import '../models/post_model.dart';

class LocalPostRepositoryImpl implements LocalPostRepository {
  final LocalPostDataSource dataSource;

  LocalPostRepositoryImpl(this.dataSource);

  @override
  Future<void> addPost(PostEntity post) async {
    await dataSource.addPost(PostModel.fromEntity(post));
  }

  @override
  Future<List<PostEntity>> getLocalPosts() async {
    return await dataSource.getPosts();
  }
}
