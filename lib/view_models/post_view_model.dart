import 'package:mvvm_frame/models/post_model.dart';
import 'package:mvvm_frame/repositories/posts_repository.dart';

class PostViewModel {
  PostModel? postsModel;
  PostViewModel({this.postsModel});

  get id => postsModel?.id;
  get userId => postsModel?.userId;
  get title => postsModel?.title?.toUpperCase();
  get body => postsModel?.body;
}
