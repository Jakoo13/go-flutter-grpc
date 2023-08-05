import 'package:dartz/dartz.dart';
import 'package:flutter_client/features/blog/domain/repositories/blog_repository.dart';
import '../../../shared/domain/usecases/usecases.dart';

class CreateBlog implements UseCase<Either<String, String>, CreateBlogParams> {
  final BlogRepository repository;

  CreateBlog({required this.repository});

  @override
  call(CreateBlogParams params) async {
    return await repository.createBlog(params);
  }
}

class CreateBlogParams extends Params {
  final String authorId;
  final String title;
  final String content;

  CreateBlogParams({
    required this.authorId,
    required this.title,
    required this.content,
  });

  @override
  List<Object?> get props => [authorId, title, content];
}
