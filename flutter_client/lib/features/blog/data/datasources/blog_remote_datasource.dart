import 'package:flutter_client/features/blog/domain/entities/blog_entity.dart';

import '../../../../core/data_helper.dart';

abstract class BlogRemoteDatasource {
  Future<String> createBlog(String authorId, String title, String content);
  Stream<BlogEntity> getBlogs();
}

class BlogRemoteDatasourceImpl implements BlogRemoteDatasource {
  final _dataHelper = DataHelperImpl.instance;

  @override
  Future<String> createBlog(
      String authorId, String title, String content) async {
    final response =
        await _dataHelper.grpcHelper.createBlog(authorId, title, content);

    return response;
  }

  @override
  Stream<BlogEntity> getBlogs() async* {
    final response = _dataHelper.grpcHelper.getBlogs();
    
    yield* response;
  }
}
