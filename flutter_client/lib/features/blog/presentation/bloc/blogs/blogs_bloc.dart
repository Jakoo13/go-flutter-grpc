import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_client/features/blog/domain/usecases/get_blogs.dart';
import 'package:flutter_client/features/shared/domain/usecases/usecases.dart';

import '../../../domain/entities/blog_entity.dart';

part 'blogs_event.dart';
part 'blogs_state.dart';

class BlogsBloc extends Bloc<BlogsEvent, BlogsState> {
  late GetBlogs getBlogs;

  BlogsBloc({
    required this.getBlogs,
  }) : super(BlogsInitial()) {
    on<GetBlogsStream>(_onGetBlogsStream);
    on<NewBlogsAddedEvent>(_onNewBlogsAdded);
  }
  
  StreamSubscription< BlogEntity> ? streamSubscription;

  var listBlogEntities = <BlogEntity>[];
  void _onGetBlogsStream(GetBlogsStream event, Emitter<BlogsState> emit) async {
    emit(BlogsLoading());
    try {
      var myStream = getBlogs(NoParams());
      // If no values return
      print(myStream.runtimeType);

      emit(const NewBlogsAdded(blogs: []));

      streamSubscription = myStream.listen((event) {
        print(event);
        listBlogEntities.add(event);
        print("EVENT $event");
        add(NewBlogsAddedEvent(blogs: listBlogEntities));
      });
    } catch (e) {
      emit(BlogsError(message: e.toString()));
    }
  }

  void _onNewBlogsAdded(
      NewBlogsAddedEvent event, Emitter<BlogsState> emit) async {
    emit(Adding());
    await Future.delayed(const Duration(seconds: 1));
    emit(NewBlogsAdded(blogs: event.blogs));
  }
}
