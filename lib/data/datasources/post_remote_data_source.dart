import 'package:flutter/cupertino.dart';
import 'package:simple_post_app/cors/constants/api_endpoints.dart';

import '../../cors/services/remote/api_service.dart';
import '../../domain/entities/post_entity.dart';
import '../models/post_model.dart';

abstract class PostRemoteDataSource {
  Future<List<PostEntity>> fetchPosts();
}



class PostRemoteDataSourceImpl implements PostRemoteDataSource {
  final ApiService apiService;

  PostRemoteDataSourceImpl(this.apiService);

  @override
  Future<List<PostEntity>> fetchPosts() async {
    final response = await apiService.get(ApiEndpoints.getPost);
    final List data = response.data;
    debugPrint("data: ${data}");
    return data.map((e) => PostModel.fromJson(e)).toList();
  }
}
