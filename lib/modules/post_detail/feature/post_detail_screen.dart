import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:sekawan_media_test/core/app_color.dart';
import 'package:sekawan_media_test/core/typography.dart';
import 'package:sekawan_media_test/modules/post_detail/data/post_comments_model.dart';
import 'package:sekawan_media_test/modules/post_detail/data/post_detail_repository.dart';
import 'package:sekawan_media_test/modules/post/data/posts_model.dart';

class PostDetailScreen extends StatefulWidget {
  const PostDetailScreen({required this.postId, super.key});
  final int postId;

  @override
  State<PostDetailScreen> createState() => _PostDetailScreenState();
}

class _PostDetailScreenState extends State<PostDetailScreen> {
  final postRepo = PostDetailRepository();
  PostModel post = PostModel();
  List comments = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Post ${widget.postId}",
          style: heading4.copyWith(
            color: AppColor.warmWhite,
          ),
        ),
        centerTitle: true,
        foregroundColor: AppColor.warmWhite,
        backgroundColor: AppColor.darkBlue,
      ),
      backgroundColor: AppColor.warmWhite,
      body: SafeArea(
        child: !isLoading
            ? SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 24,
                    horizontal: 16,
                  ),
                  child: Column(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "${post.title}",
                            style: heading3,
                            textAlign: TextAlign.center,
                          ),
                          const SizedBox(height: 16),
                          Text(
                            "${post.body}",
                            style: paragraph1,
                          ),
                        ],
                      ),
                      const SizedBox(height: 32),
                      Text(
                        "Comments",
                        style: heading4.copyWith(
                          decoration: TextDecoration.underline,
                        ),
                      ),
                      ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: comments.length,
                        itemBuilder: (context, index) {
                          final PostCommentModel comment =
                              PostCommentModel.fromJson(comments[index]);
                          return ListTile(
                            contentPadding: const EdgeInsets.all(0),
                            title: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "${comment.name}",
                                  style: heading5,
                                ),
                                Text(
                                  "${comment.email}",
                                  style: heading6,
                                )
                              ],
                            ),
                            subtitle: Text(
                              "${comment.body}",
                              style: paragraph2,
                            ),
                          );
                        },
                      )
                    ],
                  ),
                ),
              )
            : const Center(
                child: CircularProgressIndicator(),
              ),
      ),
    );
  }

  Future<void> fetchData() async {
    setState(() {
      isLoading = true;
    });

    await Future.wait([
      getPostDetail(),
      getPostComments(),
    ]);

    setState(() {
      isLoading = false;
    });
  }

  Future<void> getPostDetail() async {
    try {
      final Response response =
          await postRepo.getPostDetail(postId: widget.postId);
      setState(() {
        post = PostModel.fromJson(response.data);
      });
    } catch (e) {
      setState(() {
        isLoading = false;
      });
      debugPrint("error => $e");
    }
  }

  Future<void> getPostComments() async {
    try {
      final Response response =
          await postRepo.getPostComments(postId: widget.postId);

      setState(() {
        comments = response.data;
      });
      debugPrint("comments => ${response.data}");
    } catch (e) {
      setState(() {
        isLoading = false;
      });
      debugPrint("error => $e");
    }
  }
}
