import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:hive/hive.dart';

import '../../data/datasources/local_post_data_source.dart';
import '../../data/datasources/post_remote_data_source.dart';
import '../../data/repositories/local_post_repository_impl.dart';
import '../../data/repositories/post_repository_impl.dart';
import '../../domain/repositories/local_post_repository.dart';
import '../../domain/repositories/post_repository.dart';
import '../../domain/usecases/add_local_post_use_case.dart';
import '../../domain/usecases/get_posts_usecase.dart';
import '../../presentation/viewmodels/add_post/add_post_view_model.dart';
import '../../presentation/viewmodels/home/home_viewmodel.dart';
import '../services/remote/api_service.dart';

final GetIt getIt = GetIt.instance;

Future<void> configureDependencies() async {
  final postBox = Hive.box('posts');

  // Core
  getIt.registerLazySingleton<Dio>(() => Dio());
  getIt.registerLazySingleton<ApiService>(() => ApiService());

  // Data sources
  getIt.registerLazySingleton<PostRemoteDataSource>(
    () => PostRemoteDataSourceImpl(getIt<ApiService>()),
  );

  // Repositories
  getIt.registerLazySingleton<PostRepository>(
    () => PostRepositoryImpl(getIt<PostRemoteDataSource>()),
  );

  // Use cases
  getIt.registerLazySingleton<GetPostsUseCase>(
    () => GetPostsUseCase(getIt<PostRepository>()),
  );

  // ViewModels
  getIt.registerFactory<HomeViewModel>(
    () => HomeViewModel(getIt<GetPostsUseCase>()),
  );


  getIt.registerLazySingleton<LocalPostDataSource>(() => LocalPostDataSourceImpl(postBox));
  getIt.registerLazySingleton<LocalPostRepository>(() => LocalPostRepositoryImpl(getIt()));

  getIt.registerLazySingleton(() => AddLocalPostUseCase(getIt()));
  getIt.registerLazySingleton(() => GetLocalPostsUseCase(getIt()));

  getIt.registerFactory(() => AddPostViewModel(getIt(), getIt()));

}
