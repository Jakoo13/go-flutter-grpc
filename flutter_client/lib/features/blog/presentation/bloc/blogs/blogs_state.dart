part of 'blogs_bloc.dart';

abstract class BlogsState extends Equatable {
  const BlogsState();

  @override
  List<Object> get props => [];
}

class BlogsInitial extends BlogsState {}

class BlogsLoading extends BlogsState {}

class BlogsError extends BlogsState {
  final String message;

  const BlogsError({required this.message});

  @override
  List<Object> get props => [message];
}

class BlogStreamLoaded extends BlogsState {
  final Stream<List<BlogEntity>> blogStream;
  final List<BlogEntity> blogs;

  const BlogStreamLoaded({required this.blogStream, required this.blogs});
  @override
  List<Object> get props => [blogStream, blogs];
}

class NewBlogsAdded extends BlogsState {
  final List<BlogEntity> blogs;

  const NewBlogsAdded({required this.blogs});

  @override
  List<Object> get props => [blogs];
}

class Adding extends BlogsState {}