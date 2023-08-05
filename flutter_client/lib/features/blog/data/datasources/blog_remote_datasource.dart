import 'package:flutter_client/features/blog/data/models/blog_model.dart';

import '../../../../core/data_helper.dart';

abstract class BlogRemoteDatasource {
  Future<String> createBlog(String authorId, String title, String content);
  Future<List<BlogModel>> getBlogs();
  
}


class BlogRemoteDatasourceImpl implements BlogRemoteDatasource {
   final _dataHelper = DataHelperImpl.instance;

  @override
  Future<String> createBlog(String authorId, String title, String content) async {
    final response =
        await _dataHelper.grpcHelper.createBlog( authorId, title, content);

    return response;
  }

  @override
  Future<List<BlogModel>> getBlogs() async {
    final response = await _dataHelper.grpcHelper.getBlogs();

    return response;
  }
}