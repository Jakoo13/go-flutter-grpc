part of 'blog_item_bloc.dart';

abstract class BlogItemState extends Equatable {
  const BlogItemState();

  @override
  List<Object> get props => [];
}

class BlogItemInitial extends BlogItemState {}

class BlogItemLoading extends BlogItemState {}

class CreateBlogItemSuccess extends BlogItemState {
  final String blogId;

  const CreateBlogItemSuccess({required this.blogId});

  @override
  List<Object> get props => [blogId];
}

class BlogItemError extends BlogItemState {
  final String message;

  const BlogItemError({required this.message});

  @override
  List<Object> get props => [message];
}
