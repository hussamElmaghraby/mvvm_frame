import 'package:flutter/material.dart';
import 'package:mvvm_frame/models/post_model.dart';
import 'package:mvvm_frame/repositories/posts_api.dart';
import 'package:mvvm_frame/view_models/post_view_model.dart';
import 'package:mvvm_frame/view_models/posts_view_model.dart';

class PostView extends StatelessWidget {
  // const PostView({Key? key}) : super(key: key);
  // dependency injection /inject suitable data source
  var postsViewModel = PostsViewModel(postRepository: PostsApi());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(postsViewModel.title),
      ),
      body: Center(
          child: FutureBuilder<List<PostViewModel>>(
        builder: (ctx, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const CircularProgressIndicator();
          } else {
            var posts = snapshot.data;
            return ListView.builder(
                itemCount: posts?.length,
                itemBuilder: (ctx, idx) {
                  final post = posts?[idx];
                  return Card(
                    child: Text(post?.title),
                  );
                });
          }
        },
        future: postsViewModel.fetchAllPosts(),
      )),
    );
  }
}
