import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';

import '../../data/datasources/local_post_data_source.dart';
import '../../data/datasources/post_remote_data_source.dart';
import '../../data/models/post_model.dart';
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
  // Initialize Hive
  final appDir = await getApplicationDocumentsDirectory();
  Hive.init(appDir.path);
  Hive.registerAdapter(PostModelAdapter());
  final box = await Hive.openBox<PostModel>('posts');

  // Core
  getIt.registerLazySingleton<Dio>(() => Dio());
  getIt.registerLazySingleton<ApiService>(() => ApiService());

  // Data sources
  getIt.registerLazySingleton<PostRemoteDataSource>(
        () => PostRemoteDataSourceImpl(getIt<ApiService>()),
  );
  getIt.registerLazySingleton<LocalPostDataSource>(
        () => LocalPostDataSourceImpl(box),
  );

  // Repositories
  getIt.registerLazySingleton<PostRepository>(
        () => PostRepositoryImpl(getIt<PostRemoteDataSource>()),
  );
  getIt.registerLazySingleton<LocalPostRepository>(
        () => LocalPostRepositoryImpl(getIt<LocalPostDataSource>()),
  );

  // Use cases
  getIt.registerLazySingleton<GetPostsUseCase>(
        () => GetPostsUseCase(getIt<PostRepository>()),
  );
  getIt.registerLazySingleton<AddLocalPostUseCase>(
        () => AddLocalPostUseCase(getIt<LocalPostRepository>()),
  );
  getIt.registerLazySingleton<UpdateLocalPostUseCase>(
        () => UpdateLocalPostUseCase(getIt<LocalPostRepository>()),
  );
  getIt.registerLazySingleton<DeleteLocalPostUseCase>(
        () => DeleteLocalPostUseCase(getIt<LocalPostRepository>()),
  );
  getIt.registerLazySingleton<GetLocalPostsUseCase>(
        () => GetLocalPostsUseCase(getIt<LocalPostRepository>()),
  );

  // ViewModels
  getIt.registerFactory<HomeViewModel>(
        () => HomeViewModel(getIt<GetPostsUseCase>()),
  );
  getIt.registerFactory<AddPostViewModel>(
        () => AddPostViewModel(
      getIt<AddLocalPostUseCase>(),
      getIt<UpdateLocalPostUseCase>(),
      getIt<DeleteLocalPostUseCase>(),
      getIt<GetLocalPostsUseCase>(),
    ),
  );
}