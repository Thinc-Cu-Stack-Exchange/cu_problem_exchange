import 'package:colorful_safe_area/colorful_safe_area.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../widget/drawer.dart';
import '../widget/images_view.dart';
import '../widget/post/answer.dart';
import '../widget/post/post_bottom.dart';
import '../widget/post/post_header.dart';
import '../widget/post/post_text.dart';
import '../widget/post/post_title.dart';
import '../widget/tabbar.dart';

class MainPost extends GetView<MainPostController> {
  MainPost({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    MainPostArguments arguments = Get.arguments;
    return Scaffold(
      appBar: CustomTopBar(
        tag: arguments.postTag,
      ),
      drawer: CreateDrawer(
        drawerWidth: context.width * 0.75,
      ),
      bottomNavigationBar: BottomAppBar(
        color: const Color(0xffe897af),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(18),
              color: Colors.white,
            ),
            child: SizedBox(
              width: 100,
              height: 40,
              child: TextButton(
                onPressed: () {},
                child: Container(
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.fromLTRB(30, 0, 0, 0),
                  child: const Text(
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
        color: const Color(0xffe897af),
        child: ListView(
          //crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Main Post
            Container(
              color: Colors.white,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  PostHeader(
                      userImage: arguments.userImage,
                      userName: arguments.userName,
                      postTag: arguments.postTag,
                      postDate: arguments.postDate),
                  // body
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        PostTitle(
                          postTitle: arguments.postTitle,
                        ),
                        PostText(
                          postText: arguments.postText,
                        ),
                        ImagesView(
                            imageList: arguments.postImage,
                            backgroundColor: Colors.white),
                      ],
                    ),
                  ),
                  // bottom
                  PostBottom(
                    postVoted: arguments.postVoted,
                    postAnswerCount: arguments.postAnswerCount,
                    createMainPostArguments: () => arguments,
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
              child: Container(
                color: const Color(0xffffffff),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
                      child: Text(
                        (arguments.postAnswerCount == 1)
                            ? "1 Answer"
                            : "${arguments.postAnswerCount} Answers",
                        style: const TextStyle(
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
                            userImg: arguments.userImage,
                            userName: arguments.userName,
                            answerDate: "14/14/99",
                            answerText: "commentText \nPassa ",
                            reply_to: "Passao",
                            answerVote: 20,
                          ),
                          Answer(
                            userImg: arguments.userImage,
                            userName: arguments.userName,
                            answerDate: "14/14/99",
                            answerText: "commentText \nPassa ",
                            reply_to: "Passao",
                            answerVote: 20,
                          ),
                          Answer(
                            userImg: arguments.userImage,
                            userName: arguments.userName,
                            answerDate: "14/14/99",
                            answerText: "commentText \nPassa ",
                            reply_to: "Passao",
                            answerImage: Image.asset("assets/sample_image.jpg"),
                            answerVote: 20,
                          ),
                          Answer(
                            userImg: arguments.userImage,
                            userName: arguments.userName,
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

class MainPostArguments {
  final ImageProvider userImage;
  final String postTag;
  final String userName;
  final String postDate;
  final String postTitle;
  final String postText;
  final RxList<ImageProvider> postImage;
  final int postVoted;
  final int postAnswerCount;

  MainPostArguments(
      {required this.userImage,
      required this.postTag,
      required this.userName,
      required this.postDate,
      required this.postTitle,
      required this.postText,
      required this.postImage,
      required this.postVoted,
      required this.postAnswerCount});
}
