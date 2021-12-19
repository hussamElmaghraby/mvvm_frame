import 'package:mvvm_frame/models/post_model.dart';

abstract class PostRepository {
  Future<List<PostModel>> fetchAllPosts();
  Future<PostModel> fetchPostsById(int id);
}
