import 'package:flutter_client/features/blog/domain/entities/blog_entity.dart';

class BlogModel extends BlogEntity {
  const BlogModel({
    required super.authorId,
    required super.title,
    required super.content,
  });

  BlogEntity toEntity() {
    return BlogEntity(
      authorId: super.authorId,
      title: super.title,
      content: super.content,
    );
  }

  factory BlogModel.fromMap(Map<String, dynamic> map) {
    return BlogModel(
      authorId: map['authorId'],
      title: map['title'],
      content: map['content'],
    );
  }
}
