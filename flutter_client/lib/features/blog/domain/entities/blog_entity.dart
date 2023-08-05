import 'package:equatable/equatable.dart';

class BlogEntity extends Equatable {
  final String authorId;
  final String title;
  final String content;

  const BlogEntity({
    required this.authorId,
    required this.title,
    required this.content,
  });

  @override
  List<Object> get props => [authorId, title, content];
}
