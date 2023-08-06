import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/usecases/create_blog.dart';

part 'blog_item_event.dart';
part 'blog_item_state.dart';

class BlogItemBloc extends Bloc<BlogItemEvent, BlogItemState> {
  late CreateBlog createBlog;
  BlogItemBloc({
    required this.createBlog,
  }) : super(BlogItemInitial()) {
    on<CreateBlogEvent>(_onCreateBlogEvent);
  }

  void _onCreateBlogEvent(
      CreateBlogEvent event, Emitter<BlogItemState> emit) async {
    emit(BlogItemLoading());
    try {
      final response = await createBlog.call(CreateBlogParams(
          authorId: event.authorId,
          title: event.title,
          content: event.content));
      response.fold(
        (l) => emit(BlogItemError(message: l)),
        (r) {
          emit(CreateBlogItemSuccess(blogId: r));
        },
      );
    } catch (e) {
      emit(BlogItemError(message: e.toString()));
    }
  }
}
