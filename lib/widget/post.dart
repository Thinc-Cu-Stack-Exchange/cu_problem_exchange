import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CreatePost extends StatelessWidget {
  var userImage;
  var postTag;
  var userName;
  var postDate;
  var postTitle;
  var postText;
  var postImage;// optional
  var postLiked;
  var postCommentCount;
  CreatePost({
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
  var headerStyle = TextStyle(
    color: Color(0xff000000),
    fontSize: 10,
    fontWeight: FontWeight.normal,
  );
  var bodystyle = TextStyle(
    color: Color(0xff000000),
    fontSize: 18,
    fontWeight: FontWeight.normal,
  );
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10),
      child: Align(
        alignment: Alignment.center,
        child: Container(
          color: Color(0xffffffff),
          child: SizedBox(
            width: context.width*0.90,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Post Header
                Padding(
                  padding: const EdgeInsets.all(15),
                  child: Row(
                    children: [
                      CircleAvatar(
                        backgroundImage: userImage,
                        radius: 18,
                      ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(15, 0, 0, 0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.fromLTRB(0, 0, 0, 4),
                              child: SizedBox(
                                width: context.width * 0.50,
                                child: Text(
                                  postTag,
                                  style: headerStyle.apply(fontWeightDelta: 3),
                                  maxLines: 1,
                                ),
                              ),
                            ),
                            Row(
                              children: [
                                SizedBox(
                                  width: context.width * 0.50,
                                  child: Text(
                                    userName,
                                    style: headerStyle,
                                    maxLines: 1,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.fromLTRB(8, 0, 0, 0),
                                  child: Text(
                                    postDate,
                                    style: headerStyle,
                                    maxLines: 1,
                                  ),
                                )
                              ],
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                // Title
                Padding(
                  padding: EdgeInsets.fromLTRB(30, 0, 0, 15),
                  child: SizedBox(
                    width: context.width * 0.70,
                    child: Text(
                      postTitle,
                      style: bodystyle.apply(fontWeightDelta: 2),
                      maxLines: 2,
                    ),
                  ),
                ),
                // Text
                Padding(
                  padding: EdgeInsets.fromLTRB(30, 0, 0, 15),
                  child: SizedBox(
                    width: context.width * 0.70,
                    child: Text(
                      postText,
                      style: bodystyle.apply(fontSizeFactor: 0.95),
                      maxLines: 3,
                    ),
                  ),
                ),
                // Spacing
                SizedBox(
                  height: 5,
                ),
                // Bottom
                Container(
                  color: Color(0xffe897af),
                  child: SizedBox(
                    height: 30,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        // Vote
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            IconButton(
                                onPressed: () {},
                                icon: Icon(
                                  Icons.arrow_upward_outlined,
                                  size: 16,
                                )
                            ),
                            Text(
                              postLiked.toString(),
                              style: headerStyle,
                            ),
                            IconButton(
                                onPressed: () {},
                                icon: Icon(
                                  Icons.arrow_downward_outlined,
                                  size: 16,
                                )
                            )
                          ],
                        ),
                        // Comment
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            IconButton(
                                onPressed:() {},
                                icon: Icon(
                                  Icons.comment,
                                  size: 16,
                                )
                            ),
                            Text(
                              (postCommentCount > 1) ? "$postCommentCount Comments" : "$postCommentCount Comment",
                              style: headerStyle,
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
