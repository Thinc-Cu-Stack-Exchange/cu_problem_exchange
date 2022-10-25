import 'package:cu_problem_exchange/route_names.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/vote_controller.dart';

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
                    width: 15,
                    height: 15,
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: FittedBox(
                        child: IconButton(
                            onPressed: controller.voteController.toggleUpvote,
                            icon: Obx(() => Icon(
                                  Icons.keyboard_arrow_up_outlined,
                                  color: controller.voteController.upvoted.value
                                      ? const Color(0xff00B2FF)
                                      : Colors.black,
                                  size: 35,
                                ))),
                      ),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(vertical: 4),
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
                              textAlign: TextAlign.center,
                            )),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 15,
                    height: 15,
                    child: FittedBox(
                      child: IconButton(
                          onPressed: controller.voteController.toggleDownvote,
                          icon: Obx(() => Icon(
                                Icons.keyboard_arrow_down_outlined,
                                color: controller.voteController.downvoted.value
                                    ? const Color(0xffFF2A69)
                                    : Colors.black,
                                size: 35,
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
                    // Padding(
                    //   padding: const EdgeInsets.symmetric(vertical: 5),
                    //   child: SizedBox(
                    //     width: context.width * 0.50,
                    //     child: Text(
                    //       "@$reply_to",
                    //       style: headerStyle,
                    //       maxLines: 1,
                    //     ),
                    //   ),
                    // )
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
                    onPressed: () {
                      Get.toNamed(RouteNames.createReply);
                    },
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
