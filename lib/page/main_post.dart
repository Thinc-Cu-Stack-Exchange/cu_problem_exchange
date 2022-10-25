import 'package:colorful_safe_area/colorful_safe_area.dart';
import 'package:cu_problem_exchange/widget/drawer.dart';
import 'package:cu_problem_exchange/widget/postmaterial.dart';
import 'package:cu_problem_exchange/widget/tabbar.dart';
import 'package:flutter/material.dart';
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

    // widget controllers
    Get.create(() => AnswerController());
  }
}

class MainPostController extends GetxController {}

class Answer extends GetWidget<AnswerController> {
  var userImg;
  String userName;
  String answerDate;
  String reply_to;
  String answerText;
  var answerImage;
  int answerVote;
  bool showCommentBar;

  Answer({
    super.key,
    required this.userImg,
    required this.userName,
    required this.answerDate,
    required this.answerText,
    required this.reply_to,
    this.answerImage = "",
    required this.answerVote,
    this.showCommentBar = false,
  });

  final TextStyle headerStyle = const TextStyle(
    color: Color(0xff000000),
    fontSize: 12,
    fontWeight: FontWeight.normal,
  );

  @override
  Widget build(BuildContext context) {
    controller.voteController.upvotes.value = answerVote;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Commenter Info
          Row(
            //crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Up/Down Vote
              Column(
                children: [
                  SizedBox(
                    width: 20,
                    height: 20,
                    child: FittedBox(
                      child: IconButton(
                          onPressed: controller.voteController.toggleUpvote,
                          icon: Obx(() => Icon(
                                Icons.keyboard_arrow_up_outlined,
                                color: controller.voteController.upvoted.value
                                    ? const Color(0xff00B2FF)
                                    : Colors.black,
                                size: 30,
                              ))),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SizedBox(
                      width: 17,
                      child: Align(
                        alignment: Alignment.center,
                        child: Obx(() => Text(
                              controller.voteController.totalUpvotes.toString(),
                              style: const TextStyle(
                                fontSize: 10,
                              ),
                              maxLines: 2,
                            )),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 20,
                    height: 20,
                    child: FittedBox(
                      child: IconButton(
                          onPressed: controller.voteController.toggleDownvote,
                          icon: Obx(() => Icon(
                                Icons.keyboard_arrow_down_outlined,
                                color: controller.voteController.downvoted.value
                                    ? const Color(0xffFF2A69)
                                    : Colors.black,
                                size: 30,
                              ))),
                    ),
                  )
                ],
              ),
              // Avatar
              Padding(
                padding: const EdgeInsets.fromLTRB(7, 0, 0, 0),
                child: CircleAvatar(
                  backgroundImage: userImg,
                  radius: 18,
                ),
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
                            answerDate,
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
          ),

          // Comment Text
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 15, 0, 0),
            child: SizedBox(
              width: context.width - (2 * 15),
              child: Text(
                answerText,
                style: const TextStyle(
                  color: Color(0xff000000),
                  fontSize: 16,
                  fontWeight: FontWeight.normal,
                ).apply(fontSizeFactor: 0.95),
              ),
            ),
          ),

          // Comment Img
          (answerImage != "")
              ? Padding(
                  padding: const EdgeInsets.fromLTRB(15, 10, 0, 0),
                  child: SizedBox(
                    width: context.width - 35,
                    child: FittedBox(
                      child: answerImage,
                    ),
                  ),
                )
              : Container(),

          // Reply button
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
            child: Align(
              alignment: Alignment.centerRight,
              child: Container(
                decoration: BoxDecoration(
                  color: const Color(0xffe897af),
                  borderRadius: BorderRadius.circular(18),
                ),
                child: SizedBox(
                  height: 20,
                  child: ElevatedButton.icon(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.reply,
                      size: 15,
                    ),
                    label: const Text(
                      "Reply",
                      style: TextStyle(
                        color: Color(0xffffffff),
                        fontSize: 10,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class AnswerController extends GetxController {
  final voteController = VoteController();
}
