part of 'blog_bloc.dart';

abstract class BlogState extends Equatable {
  const BlogState();  

  @override
  List<Object> get props => [];
}
class BlogInitial extends BlogState {}

class BlogLoading extends BlogState {}

class GetBlogsSuccess extends BlogState {
  final List<BlogEntity> blogs;

  const GetBlogsSuccess({required this.blogs});

  @override
  List<Object> get props => [blogs];
}

class CreateBlogSuccess extends BlogState {
  final String id;

  const CreateBlogSuccess({required this.id});

  @override
  List<Object> get props => [id];
}

class BlogError extends BlogState {
  final String message;

  const BlogError({required this.message});

  @override
  List<Object> get props => [message];
}
