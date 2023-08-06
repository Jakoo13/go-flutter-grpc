part of 'blogs_bloc.dart';

abstract class BlogsEvent extends Equatable {
  const BlogsEvent();

  @override
  List<Object> get props => [];
}

class GetBlogsStream extends BlogsEvent {}

class NewBlogsAddedEvent extends BlogsEvent {
  final List<BlogEntity> blogs;

  const NewBlogsAddedEvent({required this.blogs});

  @override
  List<Object> get props => [blogs];
}
