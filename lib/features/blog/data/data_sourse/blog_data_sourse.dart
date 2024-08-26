import 'dart:io';

import 'package:bloc_app/core/error/exceptions.dart';
import 'package:bloc_app/features/blog/data/model/blog_model.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

abstract interface class BlogRemoteDataSourse {
  Future<BlogModel> uploadBlog(BlogModel blog);


  Future<String> uploadBlogImage({
    required File image, required BlogModel blogModel,
});
}



class BlogRemoteDataSourseImpl implements BlogRemoteDataSourse {
  final SupabaseClient supabaseClient;

  BlogRemoteDataSourseImpl(this.supabaseClient);

  @override
  Future<BlogModel> uploadBlog(BlogModel blog) async {
    try {
      final blogData =
          await supabaseClient.from('blogs').insert(blog.toJson()).select();
      return BlogModel.fromJson(blogData.first);
    } catch (e) {
      throw ServerException(e.toString());
    }
    throw UnimplementedError();
  }

  @override
  Future<String> uploadBlogImage({required File image, required BlogModel blogModel}) async{
    try{
      await supabaseClient.storage.from('blog_images').upload(blogModel.id, image);
      return supabaseClient.storage.from('blog_images').getPublicUrl(blogModel.id);
    }catch(e){
      throw ServerException(e.toString());
    }
    throw UnimplementedError();
  }
}
