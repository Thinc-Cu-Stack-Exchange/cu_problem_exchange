import 'package:flutter/material.dart';
import 'package:get/get.dart';

import './post_bottom.dart';
import './post_header.dart';
import '../../route_names.dart';
import '../images_view.dart';

class Post extends GetWidget<PostController> {
  var userImage;
  String postTag;
  String userName;
  String postDate;
  String postTitle;
  String postText; // optional
  RxList<ImageProvider> postImage; // optional
  int postVoted;
  int postAnswerCount;

  Post({
    super.key,
    required this.userImage,
    required this.postTag,
    required this.userName,
    required this.postDate,
    required this.postTitle,
    this.postText = "",
    required this.postImage,
    required this.postVoted,
    required this.postAnswerCount,
  });

  final headerStyle = const TextStyle(
    color: Color(0xff000000),
    fontSize: 10,
    fontWeight: FontWeight.normal,
  );

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Align(
        alignment: Alignment.center,
        child: Container(
          color: const Color(0xffffffff),
          child: SizedBox(
            width: context.width * 0.90,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Post Header
                PostHeader(
                    userImage: userImage,
                    userName: userName,
                    postTag: postTag,
                    postDate: postDate),
                // body post
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Title
                    Align(
                      alignment: Alignment.center,
                      child: SizedBox(
                        width: context.width * 0.80,
                        child: TextButton(
                          onPressed: controller.bodyPressed,
                          style: ButtonStyle(
                            padding:
                                MaterialStateProperty.all<EdgeInsetsGeometry>(
                                    const EdgeInsets.all(0)),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // Title
                              Padding(
                                padding: const EdgeInsets.fromLTRB(0, 5, 0, 15),
                                child: Text(
                                  postTitle,
                                  style: const TextStyle(
                                    color: Color(0xff000000),
                                    fontSize: 18,
                                    fontWeight: FontWeight.normal,
                                  ),
                                  maxLines: 2,
                                ),
                              ),
                              // Text
                              (postText != "")
                                  ? (Padding(
                                      padding: const EdgeInsets.fromLTRB(
                                          0, 0, 0, 20),
                                      child: Text(
                                        postText,
                                        style: const TextStyle(
                                          color: Color(0xff000000),
                                          fontSize: 16,
                                          fontWeight: FontWeight.normal,
                                        ).apply(fontSizeFactor: 0.95),
                                        maxLines: 3,
                                      ),
                                    ))
                                  : Container(),
                            ],
                          ),
                        ),
                      ),
                    ),
                    // Img
                    ImagesView(
                      imageList: postImage,
                    ),
                  ],
                ),

                // Bottom
                PostBottom(
                    postVoted: postVoted, postAnswerCount: postAnswerCount)
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class PostController extends GetxController {
  void commentPressed() {
    Get.toNamed(RouteNames.mainPost);
  }

  void bodyPressed() {
    Get.toNamed(RouteNames.mainPost);
  }
}