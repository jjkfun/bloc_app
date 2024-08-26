import 'dart:io';

import 'package:bloc_app/core/error/exceptions.dart';
import 'package:bloc_app/core/error/failure.dart';
import 'package:bloc_app/features/blog/data/data_sourse/blog_data_sourse.dart';
import 'package:bloc_app/features/blog/data/model/blog_model.dart';
import 'package:bloc_app/features/blog/domain/entities/blog.dart';
import 'package:bloc_app/features/blog/domain/repositories/blog_repositories.dart';
import 'package:fpdart/src/either.dart';
import 'package:uuid/uuid.dart';

class BlogRepositoriesImpl implements BlogRepositories {
  final BlogRemoteDataSourse blogRemoteDataSourse;

  BlogRepositoriesImpl(this.blogRemoteDataSourse);

  @override
  Future<Either<Failure, Blog>> uploadBlog(
      {required File image,
      required String title,
      required String content,
      required String posterId,
      required List<String> topics}) async {
    try {
      BlogModel blogModel = BlogModel(
        id: const Uuid().v1(),
        posterId: posterId,
        title: title,
        content: content,
        imageUrl: '',
        topics: topics,
        updateAt: DateTime.now(),
      );
      final imageUrl = await blogRemoteDataSourse.uploadBlogImage(image: image, blogModel: blogModel);
      blogModel = blogModel.copyWith(imageUrl: imageUrl);
      final uploadBlog = blogRemoteDataSourse.uploadBlog(blogModel);
      right(uploadBlog);
  }  on ServerException catch (e) {
      left(Failure(e.toString(),),);
    }
    throw UnimplementedError();

  }
}
