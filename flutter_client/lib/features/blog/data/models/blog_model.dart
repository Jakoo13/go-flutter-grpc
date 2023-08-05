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
}
