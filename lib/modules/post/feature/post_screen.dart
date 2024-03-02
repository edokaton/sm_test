import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:sekawan_media_test/core/app_color.dart';
import 'package:sekawan_media_test/core/typography.dart';
import 'package:sekawan_media_test/modules/post_detail/feature/post_detail_screen.dart';
import 'package:sekawan_media_test/modules/post/data/posts_model.dart';
import 'package:sekawan_media_test/modules/post/data/posts_repository.dart';

class PostScreen extends StatefulWidget {
  const PostScreen({super.key});

  @override
  State<PostScreen> createState() => _PostScreenState();
}

class _PostScreenState extends State<PostScreen> {
  final postsRepo = PostsRepository();
  List posts = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    getPosts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: AppColor.warmWhite,
        backgroundColor: AppColor.darkBlue,
        title: Text(
          "TES MOBILE DEVELOPER",
          style: heading4.copyWith(
            color: AppColor.warmWhite,
          ),
        ),
        centerTitle: true,
      ),
      backgroundColor: AppColor.warmWhite,
      body: RefreshIndicator(
        onRefresh: () async => getPosts(),
        child: SafeArea(
          child: !isLoading
              ? SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 32,
                    ),
                    child: ListView.separated(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: posts.length,
                      itemBuilder: (context, index) {
                        final PostModel post = PostModel.fromJson(posts[index]);

                        return ListTile(
                          contentPadding: const EdgeInsets.all(0),
                          title: Text(
                            "${post.title}",
                            style: heading5,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                          subtitle: Text(
                            "${post.body}",
                            style: caption1,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.justify,
                          ),
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => PostDetailScreen(
                                  postId: post.id!,
                                ),
                              ),
                            );
                          },
                        );
                      },
                      separatorBuilder: (context, index) => const Divider(
                        color: Colors.black,
                        thickness: 1,
                      ),
                    ),
                  ),
                )
              : const Center(
                  child: CircularProgressIndicator(),
                ),
        ),
      ),
    );
  }

  getPosts() async {
    setState(() {
      isLoading = true;
    });
    try {
      final Response response = await postsRepo.getPostList({});
      setState(() {
        isLoading = false;
        posts = response.data;
      });
    } catch (e) {
      setState(() {
        isLoading = false;
      });
      debugPrint("error => $e");
    }
  }
}
