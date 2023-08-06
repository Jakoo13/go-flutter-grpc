import 'package:dartz/dartz.dart';
import 'package:flutter_client/features/blog/domain/entities/blog_entity.dart';

import '../../domain/repositories/blog_repository.dart';
import '../../domain/usecases/create_blog.dart';
import '../datasources/blog_remote_datasource.dart';

class BlogRepositoryImpl implements BlogRepository {
  final BlogRemoteDatasource remoteDataSource;

  BlogRepositoryImpl({
    required this.remoteDataSource,
  });

  @override
  Future<Either<String, String>> createBlog(CreateBlogParams params) async {
    try {
      var result = await remoteDataSource.createBlog(
        params.authorId,
        params.title,
        params.content,
      );
      return Right(
        result,
      );
    } catch (e) {
      return Left(e.toString());
    }
  }

  @override
  Stream<BlogEntity> getBlogs() async* {
    final response = remoteDataSource.getBlogs();

    yield* response;
  }
}
