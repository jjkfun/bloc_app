import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:bloc_app/features/blog/domain/usecases/upload_blog.dart';
import 'package:meta/meta.dart';

part 'blog_event.dart';

part 'blog_state.dart';

class BlogBloc extends Bloc<BlogEvent, BlogState> {
  final UploadBlog _uploadBlog;

  BlogBloc({required UploadBlog uploadBlog})
      : _uploadBlog = uploadBlog,
        super(BlogInitial()) {
    on<BlogEvent>((event, emit) {
      emit(
        BlogLoading(),
      );
    });
    on<BlogUpload>(_blogUpload);

  }
  void _blogUpload (BlogUpload event, Emitter<BlogState> emit) async{
    final res = await _uploadBlog(
      UploadBlogParams(image: event.image, posterId: event.posterId, title: event.title, content: event.content, topics: event.topics)
    );
    res.fold((l) => emit(BlogFailure(l.message)), ((r) => emit(BlogSuccess())));
  }
}
