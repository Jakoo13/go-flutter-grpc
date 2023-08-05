part of 'blog_bloc.dart';

abstract class BlogEvent extends Equatable {
  const BlogEvent();

  @override
  List<Object> get props => [];
}

class CreateBlogEvent extends BlogEvent {
  final String id;
  final String authorId;
  final String title;
  final String content;

  const CreateBlogEvent(
      {required this.id,
      required this.authorId,
      required this.title,
      required this.content});

  @override
  List<Object> get props => [id, authorId, title, content];
}

class GetBlogsEvent extends BlogEvent {}
