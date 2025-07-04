import 'package:hive/hive.dart';
import '../../domain/entities/post_entity.dart';

part 'post_model.g.dart';

@HiveType(typeId: 0)
class PostModel extends PostEntity {
  @HiveField(0)
  final int userId;

  @HiveField(1)
  final int id;

  @HiveField(2)
  final String title;

  @HiveField(3)
  final String body;

  const PostModel({
    required this.userId,
    required this.id,
    required this.title,
    required this.body,
  }) : super(userId: userId, id: id, title: title, body: body);

  factory PostModel.fromJson(Map<String, dynamic> json) => PostModel(
    userId: json['userId'],
    id: json['id'],
    title: json['title'],
    body: json['body'],
  );

  Map<String, dynamic> toJson() => {
    'userId': userId,
    'id': id,
    'title': title,
    'body': body,
  };

  factory PostModel.fromEntity(PostEntity entity) => PostModel(
    userId: entity.userId,
    id: entity.id,
    title: entity.title,
    body: entity.body,
  );
}
