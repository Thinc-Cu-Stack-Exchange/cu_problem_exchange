import 'package:flutter/material.dart';
import 'package:colorful_safe_area/colorful_safe_area.dart';
import 'package:cu_problem_exchange/widget/tabbar.dart';
import 'package:cu_problem_exchange/widget/drawer.dart';
import 'package:cu_problem_exchange/widget/postmaterial.dart';
import 'package:get/get.dart';

class MainPost extends GetView<MainPostController> {
  var userImage = AssetImage("assets/sample_user.png");
  String postTag = "PassaThai";
  String userName = "Poster1123456789234567823456789123456783456782345678";
  String postDate = "12/12/21";
  String postTitle =
      "Possakarnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnn";
  String postText = "PsLs \nPsLs \nPSLS \nssssssss";
  Image postImage = Image.asset("sample_image.jpg"); // optional
  int postLiked = 26;
  int postCommentCount = 69;

  MainPost({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomTopBar(
        tag: postTag,
      ),
      drawer: CreateDrawer(
        drawerWidth: context.width * 0.75,
      ),
      bottomNavigationBar: BottomAppBar(
        color: Color(0xffe897af),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 5),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(18),
              color: Color(0xffffffff),
            ),
            child: SizedBox(
              width: 100,
              height: 40,
              child: TextButton(
                onPressed: () {},
                child: Container(
                  alignment: Alignment.centerLeft,
                  padding: EdgeInsets.fromLTRB(30, 0, 0, 0),
                  child: Text(
                    "Write a comment...",
                    style: TextStyle(
                      color: Color(0xff000000),
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
      backgroundColor: const Color(0xffE7E7E7),
      body: ColorfulSafeArea(
        color: Color(0xffe897af),
        child: ListView(
          //crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Main Post
            Container(
              color: Color(0xffffffff),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CreatePostHeader(
                      userImage: userImage,
                      userName: userName,
                      postTag: postTag,
                      postDate: postDate),
                  // body
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CreateTitle(
                          postTitle: postTitle,
                        ),
                        CreateText(
                          postText: postText,
                        ),
                        CreateImg(),
                      ],
                    ),
                  ),
                  // bottom
                  CreatePostBottom(
                      postLiked: postLiked, postCommentCount: postCommentCount)
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
              child: Container(
                color: Color(0xffffffff),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
                      child: Text(
                        "Comment",
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 16,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 20,horizontal: 15),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CreateComment(
                              userImg: userImage,
                              userName: userName,
                              commentDate: "14/14/99",
                              commentText: "commentText \nPassa ",
                              reply_to: "Passao",
                          ),
                          CreateComment(
                            userImg: userImage,
                            userName: userName,
                            commentDate: "14/14/99",
                            commentText: "commentText \nPassa ",
                            reply_to: "Passao",
                          ),
                          CreateComment(
                            userImg: userImage,
                            userName: userName,
                            commentDate: "14/14/99",
                            commentText: "commentText \nPassa ",
                            reply_to: "Passao",
                            commentImage: Image.asset("assets/sample_image.jpg"),
                          ),
                          CreateComment(
                            userImg: userImage,
                            userName: userName,
                            commentDate: "14/14/99",
                            commentText: "commentTextssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss",
                            reply_to: "Passao",
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class MainPostBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => MainPostController());
  }
}

class MainPostController extends GetxController {}


class CreateComment extends StatelessWidget {
  var userImg;
  String userName;
  String commentDate;
  String reply_to;
  String commentText;
  var commentImage;
  CreateComment({
    super.key,
    required this.userImg,
    required this.userName,
    required this.commentDate,
    required this.commentText,
    required this.reply_to,
    this.commentImage = ""
  });
  final TextStyle headerStyle = const TextStyle(
    color: Color(0xff000000),
    fontSize: 12,
    fontWeight: FontWeight.normal,
  );
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          // Commenter Info
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CircleAvatar(
                backgroundImage: userImg,
                radius: 18,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: context.width * 0.45,
                          child: Text(
                            userName,
                            style: headerStyle,
                            maxLines: 1,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(8, 0, 0, 0),
                          child: Text(
                            commentDate,
                            style: headerStyle,
                            maxLines: 1,
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 5),
                      child: SizedBox(
                        width: context.width * 0.50,
                        child: Text(
                          "@$reply_to",
                          style: headerStyle,
                          maxLines: 1,
                        ),
                      ),
                    )
                  ],
                ),
              ),

            ],
          ) ,

          // Comment Text
          Padding(
            padding: EdgeInsets.fromLTRB(20, 15, 0, 15),
            child: SizedBox(
              width: context.width - (2 * 15),
              child: Text(
                commentText,
                style: const TextStyle(
                  color: Color(0xff000000),
                  fontSize: 16,
                  fontWeight: FontWeight.normal,
                ).apply(fontSizeFactor: 0.95),
              ),
            ),
          ) ,

          // Comment Img
          (commentImage != "") ?
          Padding(
            padding: const EdgeInsets.fromLTRB(15, 0, 0, 20),
            child: SizedBox(
              width: context.width - 35,
              child: FittedBox(
                child: commentImage,
              ),
            ),
          ) : Container(),


        ],
      ),
    );
  }
}

