import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/vote_controller.dart';
import '../../page/main_post.dart';
import '../../route_names.dart';

class PostBottom extends GetWidget<PostBottomController> {
  final int postVoted;
  final int postAnswerCount;
  MainPostArguments Function()? createMainPostArguments;
  final bottomStyle = const TextStyle(
    color: Color(0xff000000),
    fontSize: 10,
    fontWeight: FontWeight.normal,
  );

  PostBottom(
      {super.key,
      required this.postVoted,
      required this.postAnswerCount,
      this.createMainPostArguments});

  @override
  Widget build(BuildContext context) {
    controller.createMainPostArguments = createMainPostArguments;
    controller.voteController.upvotes.value = postVoted;

    return Container(
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
                  Obx(() => IconButton(
                      onPressed: controller.voteController.toggleUpvote,
                      icon: Icon(
                        Icons.arrow_upward_outlined,
                        size: 16,
                        color: controller.voteController.upvoted.value
                            ? const Color(0xff00B2FF)
                            : Colors.white,
                      ))),
                  // Liked post
                  Obx(() => Text(
                        controller.voteController.totalUpvotes.toString(),
                        style: bottomStyle,
                      )),
                  // Downvote icon
                  Obx(() => IconButton(
                      onPressed: controller.voteController.toggleDownvote,
                      icon: Icon(
                        Icons.arrow_downward_outlined,
                        size: 16,
                        color: controller.voteController.downvoted.value
                            ? const Color(0xffFF2A69)
                            : Colors.white,
                      )))
                ],
              ),
              // Comment
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  TextButton.icon(
                    onPressed: controller.onCommentsPressed,
                    //controller.commentPressed,
                    icon: const Icon(
                      Icons.comment,
                      size: 16,
                      color: Color(0xffffffff),
                    ),
                    label: Text(
                      (postAnswerCount > 1)
                          ? "$postAnswerCount Answers"
                          : "$postAnswerCount Answer",
                      style: bottomStyle,
                    ),
                  )
                ],
              ),
            ],
          )),
    );
  }
}

class PostBottomController extends GetxController {
  final voteController = VoteController();
  MainPostArguments Function()? createMainPostArguments;

  void onCommentsPressed() {
    if (createMainPostArguments != null) {
      Get.find<MainPostArgumentsHolder>().arguments = createMainPostArguments!();
    }
    Get.toNamed(RouteNames.mainPost);
  }
}
