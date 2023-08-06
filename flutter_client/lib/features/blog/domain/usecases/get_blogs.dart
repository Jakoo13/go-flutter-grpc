import 'package:flutter_client/features/blog/domain/entities/blog_entity.dart';
import 'package:flutter_client/features/blog/domain/repositories/blog_repository.dart';

import '../../../shared/domain/usecases/usecases.dart';

class GetBlogs
    implements UseCase<BlogEntity, NoParams> {
  final BlogRepository repository;

  GetBlogs({required this.repository});

  @override
  Stream<BlogEntity> call(NoParams params) {
    return repository.getBlogs();
  }
}
