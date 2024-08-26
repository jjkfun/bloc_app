import 'dart:io';

import 'package:bloc_app/core/error/failure.dart';
import 'package:bloc_app/core/usecases/use_case.dart';
import 'package:bloc_app/features/blog/data/model/blog_model.dart';
import 'package:bloc_app/features/blog/domain/entities/blog.dart';
import 'package:bloc_app/features/blog/domain/repositories/blog_repositories.dart';
import 'package:fpdart/src/either.dart';

class UploadBlog implements UseCases<Blog, UploadBlogParams> {
  final BlogRepositories blogRepositories;

  UploadBlog(this.blogRepositories);

  @override
  Future<Either<Failure, Blog>> call(UploadBlogParams params) async {
    return await blogRepositories.uploadBlog(image: params.image,
        title: params.title,
        content: params.content,
        posterId: params.posterId,
        topics: params.topics);
    throw UnimplementedError();
  }

}

class UploadBlogParams {
  final File image;
  final String posterId;
  final String title;
  final String content;
  final List<String> topics;

  UploadBlogParams(
      {required this.image, required this.posterId, required this.title, required this.content, required this.topics});
}