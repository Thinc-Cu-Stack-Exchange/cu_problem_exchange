import 'package:colorful_safe_area/colorful_safe_area.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../widget/drawer.dart';
import '../widget/post/answer.dart';
import '../widget/tabbar.dart';
import '../widget/post/post_image.dart';
import '../widget/post/post_bottom.dart';
import '../widget/post/post_header.dart';
import '../widget/post/post_text.dart';
import '../widget/post/post_title.dart';

class MainPost extends GetView<MainPostController> {
  var userImage = AssetImage("assets/sample_user.png");
  String postTag = "PassaThai";
  String userName = "Poster1123456789234567823456789123456783456782345678";
  String postDate = "12/12/21";
  String postTitle =
      "Possakarnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnn";
  String postText = "PsLs \nPsLs \nPSLS \nssssssss";
  Image postImage = Image.asset("sample_image.jpg"); // optional
  int postVoted = 26;
  int postAnswerCount = 69;

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
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
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
                    "Write an answer...",
                    style: TextStyle(
                      color: Color(0xff4E4E4E),
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
                  PostHeader(
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
                        PostTitle(
                          postTitle: postTitle,
                        ),
                        PostText(
                          postText: postText,
                        ),
                        PostImage(),
                      ],
                    ),
                  ),
                  // bottom
                  PostBottom(
                      postVoted: postVoted, postAnswerCount: postAnswerCount)
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
                        (postAnswerCount == 1)
                            ? "1 Answer"
                            : "$postAnswerCount Answers",
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 16,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Answer(
                            userImg: userImage,
                            userName: userName,
                            answerDate: "14/14/99",
                            answerText: "commentText \nPassa ",
                            reply_to: "Passao",
                            answerVote: 20,
                          ),
                          Answer(
                            userImg: userImage,
                            userName: userName,
                            answerDate: "14/14/99",
                            answerText: "commentText \nPassa ",
                            reply_to: "Passao",
                            answerVote: 20,
                          ),
                          Answer(
                            userImg: userImage,
                            userName: userName,
                            answerDate: "14/14/99",
                            answerText: "commentText \nPassa ",
                            reply_to: "Passao",
                            answerImage: Image.asset("assets/sample_image.jpg"),
                            answerVote: 20,
                          ),
                          Answer(
                            userImg: userImage,
                            userName: userName,
                            answerDate: "14/14/99",
                            answerText:
                                "commentTextssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss",
                            reply_to: "Passao",
                            answerVote: 209999,
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


