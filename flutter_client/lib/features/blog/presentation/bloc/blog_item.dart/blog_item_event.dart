part of 'blog_item_bloc.dart';

abstract class BlogItemEvent extends Equatable {
  const BlogItemEvent();

  @override
  List<Object> get props => [];
}

class CreateBlogEvent extends BlogItemEvent {
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