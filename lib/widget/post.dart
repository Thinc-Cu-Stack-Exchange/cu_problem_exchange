import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:cu_problem_exchange/widget/postmaterial.dart';

class CreatePost extends StatelessWidget {
  Widget userImage;
  String postTag;
  String userName;
  String postDate;
  String postTitle;
  String postText; // optional
  var postImage; // optional
  int postLiked;
  int postCommentCount;
  Post({
    super.key,
    required this.userImage,
    required this.postTag,
    required this.userName,
    required this.postDate,
    required this.postTitle,
    this.postText = "",
    this.postImage = "",
    required this.postLiked,
    required this.postCommentCount,
  });
  final headerStyle = const TextStyle(
    color: Color(0xff000000),
    fontSize: 10,
    fontWeight: FontWeight.normal,
  );
  var upvoteColor = const Color(0xffffffff);
  var downvoteColor = const Color(0xffffffff);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Align(
        alignment: Alignment.center,
        child: Container(
          color: const Color(0xffffffff),
          child: SizedBox(
            width: context.width*0.90,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Post Header
                CreatePostHeader(userImage: userImage, userName: userName, postTag: postTag, postDate: postDate),
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
                          onPressed: () {},
                          style: ButtonStyle(
                            padding: MaterialStateProperty.all<EdgeInsetsGeometry>(const EdgeInsets.all(0)),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.symmetric(vertical: 7),
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
                              CreateText(postText: postText),
                            ],
                          ),
                        ),
                      ),
                    ),
                    // Img
                    CreateImage(postImage: postImage,),
                  ],
                ),
                // Spacing
                const SizedBox(
                  height: 15,
                ),
                // Bottom
                Container(
                  color: const Color(0xffe897af),
                  child: SizedBox(
                    height: 30,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        // Vote
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            // Upvote icon
                            IconButton(
                                onPressed: () {
                                  if (upvoteColor == const Color(0xffffffff)) {
                                    upvoteColor = const Color(0xff00B2FF);
                                    postLiked += 1;
                                  } else {
                                    upvoteColor = const Color(0xffffffff);
                                    postLiked -= 1;
                                  }
                                },
                                icon: Icon(
                                  Icons.arrow_upward_outlined,
                                  size: 16,
                                  color: upvoteColor,
                                )
                            ),
                            // Liked post
                            Text(
                              postLiked.toString(),
                              style: headerStyle,
                            ),
                            // Downvote icon
                            IconButton(
                                onPressed: () {
                                  if (downvoteColor == const Color(0xffffffff)) {
                                    downvoteColor = const Color(0xffFF2A69);
                                    postLiked = min(postLiked - 1,  0);
                                  } else {
                                    downvoteColor = const Color(0xffffffff);
                                    postLiked += 1;
                                  }
                                },
                                icon: Icon(
                                  Icons.arrow_downward_outlined,
                                  size: 16,
                                  color: downvoteColor,
                                )
                            )
                          ],
                        ),
                        // Comment
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            TextButton.icon(
                                onPressed: () {},
                                icon: const Icon(
                                  Icons.comment,
                                  size: 16,
                                  color: Color(0xffffffff),
                                ),
                                label: Text(
                                  (postCommentCount > 1) ? "$postCommentCount Comments" : "$postCommentCount Comment",
                                  style: headerStyle,
                                ),
                            )
                          ],
                        ),
                      ],

                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}




