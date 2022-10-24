import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CreatePostHeader extends StatelessWidget {
  final userImage;
  final postTag;
  final userName;
  final postDate;
  final headerStyle = TextStyle(
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
            padding: EdgeInsets.fromLTRB(15, 0, 0, 0),
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
                            EdgeInsets.all(0)),
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

class CreateTitle extends StatelessWidget {
  final postTitle;
  final bodystyle = TextStyle(
    color: Color(0xff000000),
    fontSize: 18,
    fontWeight: FontWeight.normal,
  );

  CreateTitle({super.key, required this.postTitle});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 7),
      child: Text(
        postTitle,
        style: bodystyle.apply(fontWeightDelta: 2),
        maxLines: 2,
      ),
    );
  }
}

class CreateText extends StatelessWidget {
  final postText;
  final bodystyle = TextStyle(
    color: Color(0xff000000),
    fontSize: 16,
    fontWeight: FontWeight.normal,
  );

  CreateText({super.key, required this.postText});

  @override
  Widget build(BuildContext context) {
    return (postText != "")
        ? (Padding(
            padding: EdgeInsets.symmetric(vertical: 7),
            child: Text(
              postText,
              style: bodystyle.apply(fontSizeFactor: 0.95),
              maxLines: 3,
            ),
          ))
        : Container();
  }
}

class CreateImage extends StatelessWidget {
  var postImage;

  CreateImage({super.key, required this.postImage});

  @override
  Widget build(BuildContext context) {
    return (postImage != "")
        ? GestureDetector(
            onDoubleTap: () {}, // Zoom
            child: (SizedBox(
              //width: context.width * 0.90,
              child: FittedBox(
                fit: BoxFit.fitWidth,
                child: postImage,
              ),
            )),
          )
        : Container();
  }
}
