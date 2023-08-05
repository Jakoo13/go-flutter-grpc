import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_client/features/blog/domain/usecases/create_blog.dart';
import 'package:flutter_client/features/blog/domain/usecases/get_blogs.dart';

import '../../../shared/domain/usecases/usecases.dart';
import '../../domain/entities/blog_entity.dart';

part 'blog_event.dart';
part 'blog_state.dart';

class BlogBloc extends Bloc<BlogEvent, BlogState> {
  late GetBlogs getBlogs;
  late CreateBlog createBlog;

  BlogBloc({
    required this.createBlog,
    required this.getBlogs,
  }) : super(BlogInitial()) {
    on<GetBlogsEvent>(_onGetBlogsEvent);
    on<CreateBlogEvent>(_onCreateBlogEvent);
  }

  void _onGetBlogsEvent(GetBlogsEvent event, Emitter<BlogState> emit) async {
    emit(BlogLoading());
    try {
      final response = await getBlogs.call(NoParams());
      response.fold(
        (l) => emit(BlogError(message: l)),
        (r) => emit(GetBlogsSuccess(blogs: r)),
      );
    } catch (e) {
      emit(BlogError(message: e.toString()));
    }
  }

  void _onCreateBlogEvent(
      CreateBlogEvent event, Emitter<BlogState> emit) async {
    emit(BlogLoading());
    try {
      final response = await createBlog.call(CreateBlogParams(
          authorId: event.authorId,
          title: event.title,
          content: event.content));
      response.fold(
        (l) => emit(BlogError(message: l)),
        (r) => emit(CreateBlogSuccess(id: r)),
      );
    } catch (e) {
      emit(BlogError(message: e.toString()));
    }
  }
}
