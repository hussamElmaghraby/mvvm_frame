import 'package:dio/dio.dart';
import 'package:mvvm_frame/models/post_model.dart';
import 'package:mvvm_frame/repositories/posts_api.dart';
import 'package:mvvm_frame/repositories/posts_repository.dart';
import 'package:mvvm_frame/view_models/post_view_model.dart';

class PostsViewModel {
  String title = "All Posts";
  PostRepository? postRepository;
  PostsViewModel({this.postRepository});

  Future<List<PostViewModel>> fetchAllPosts() async {
    List<PostModel> list = await postRepository!.fetchAllPosts();
    return list.map((post) => PostViewModel(postsModel: post)).toList();
  }
}
