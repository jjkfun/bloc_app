part of 'blog_bloc.dart';

@immutable
sealed class BlogEvent {}

final class BlogUpload extends BlogEvent{
  final String posterId;
  final String title;
  final String content;
  final File image;
  final List<String> topics;

  BlogUpload(this.posterId, this.title, this.content, this.image, this.topics);

}
