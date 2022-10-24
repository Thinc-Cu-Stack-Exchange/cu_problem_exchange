import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CreatePostHeader extends StatelessWidget {
  var userImage;
  final String postTag;
  final String userName;
  final String postDate;
  final TextStyle headerStyle = const TextStyle(
    color: Color(0xff000000),
    fontSize: 12,
    fontWeight: FontWeight.normal,
  );

  CreatePostHeader({
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


class CreateImage extends StatelessWidget {
  final postImage;

  const CreateImage({super.key, required this.postImage});

  @override
  Widget build(BuildContext context) {
    printInfo(info: "width: ${context.width}");
    return (postImage != "")
        ? GestureDetector(
            onDoubleTap: () {}, // Zoom
            child: (SizedBox(
              width: context.width * 0.90,
              child: FittedBox(
                fit: BoxFit.fitWidth,
                child: postImage,
              ),
            )),
          )
        : Container();
  }
}
