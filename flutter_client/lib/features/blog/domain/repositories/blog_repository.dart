import 'package:dartz/dartz.dart';
import 'package:flutter_client/features/blog/domain/entities/blog_entity.dart';
import 'package:flutter_client/features/blog/domain/usecases/create_blog.dart';

abstract class BlogRepository {
  Future<Either<String, String>> createBlog(CreateBlogParams params);
  Stream<BlogEntity> getBlogs();
}