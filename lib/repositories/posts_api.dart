import 'package:dio/dio.dart';
import 'package:mvvm_frame/models/post_model.dart';
import 'package:mvvm_frame/repositories/posts_repository.dart';

class PostsApi extends PostRepository {
  @override
  Future<List<PostModel>> fetchAllPosts() async {
    List<PostModel> posts = [];
    try {
      var response =
          await Dio().get('https://jsonplaceholder.typicode.com/posts');

      var list = response.data as List;

      posts = list.map((post) {
        //map
        return PostModel.fromJson(post);
      }).toList();

      print(response);
    } catch (ex) {
      print(ex);
    }
    return posts;
  }

  @override
  Future<PostModel> fetchPostsById(int id) {
    // TODO: implement fetchPostsById
    throw UnimplementedError();
  }
}
