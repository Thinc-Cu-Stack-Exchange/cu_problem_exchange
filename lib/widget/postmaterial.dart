import 'package:cu_problem_exchange/route_names.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PostHeader extends StatelessWidget {
  final userImage;
  final String postTag;
  final String userName;
  final String postDate;
  final TextStyle headerStyle = const TextStyle(
    color: Color(0xff000000),
    fontSize: 12,
    fontWeight: FontWeight.normal,
  );

  const PostHeader({
    super.key,
    required this.userImage,
    required this.userName,
    required this.postTag,
    required this.postDate,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15),
      child: Row(
        children: [
          // User Avatar
          CircleAvatar(
            backgroundImage: userImage,
            radius: 18,
          ),
          // User/Post info
          Padding(
            padding: const EdgeInsets.fromLTRB(15, 0, 0, 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // TagName
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 0, 0, 4),
                  child: SizedBox(
                    width: context.width * 0.50,
                    height: 25,
                    child: TextButton(
                      onPressed: () {},
                      style: ButtonStyle(
                        padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                            const EdgeInsets.all(0)),
                      ),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          postTag,
                          style: headerStyle.apply(
                              fontWeightDelta: 4, fontSizeFactor: 1.2),
                          maxLines: 1,
                        ),
                      ),
                    ),
                  ),
                ),
                // UserName & PostDate
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
    );
  }
}

class PostBottom extends GetWidget<PostBottomController> {
  final int postLiked;
  final int postCommentCount;
  final bottomStyle = const TextStyle(
    color: Color(0xff000000),
    fontSize: 10,
    fontWeight: FontWeight.normal,
  );

  const PostBottom(
      {super.key, required this.postLiked, required this.postCommentCount});

  @override
  Widget build(BuildContext context) {
    controller.postLiked.value = postLiked;
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
                      onPressed: controller.onUpvotePressed,
                      icon: Icon(
                        Icons.arrow_upward_outlined,
                        size: 16,
                        color: controller.upvoted.value
                            ? const Color(0xff00B2FF)
                            : Colors.black,
                      ))),
                  // Liked post
                  Obx(() => Text(
                        controller.totalPostLiked.toString(),
                        style: bottomStyle,
                      )),
                  // Downvote icon
                  Obx(() => IconButton(
                      onPressed: controller.onDownvotePressed,
                      icon: Icon(
                        Icons.arrow_downward_outlined,
                        size: 16,
                        color: controller.downvoted.value
                            ? const Color(0xffFF2A69)
                            : Colors.black,
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
                      (postCommentCount > 1)
                          ? "$postCommentCount Comments"
                          : "$postCommentCount Comment",
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
  var postLiked = 0.obs;
  final upvoted = false.obs;
  final downvoted = false.obs;

  int get totalPostLiked => postLiked.value + (upvoted.value ? 1 : 0) + (downvoted.value ? -1 : 0);

  void onCommentsPressed() {
    Get.toNamed(RouteNames.mainPost);
  }

  void onUpvotePressed() {
    downvoted.value = false;
    upvoted.value = !upvoted.value;
  }

  void onDownvotePressed() {
    upvoted.value = false;
    downvoted.value = !downvoted.value;
  }
}

class PostTitle extends StatelessWidget {
  final String postTitle;

  const PostTitle({super.key, required this.postTitle});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 7),
      child: Text(
        postTitle,
        style: const TextStyle(
          color: Color(0xff000000),
          fontSize: 18,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}

class PostText extends StatelessWidget {
  final String postText;

  const PostText({super.key, required this.postText});

  @override
  Widget build(BuildContext context) {
    return (postText != "")
        ? (Padding(
            padding: const EdgeInsets.symmetric(vertical: 7),
            child: Text(
              postText,
              style: const TextStyle(
                color: Color(0xff000000),
                fontSize: 16,
                fontWeight: FontWeight.normal,
              ).apply(fontSizeFactor: 0.95),
            ),
          ))
        : Container();
  }
}

class PostImage extends StatelessWidget {
  const PostImage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
