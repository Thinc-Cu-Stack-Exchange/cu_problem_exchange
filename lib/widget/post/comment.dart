import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Comment extends StatelessWidget {
  var userImage ;
  String commentText ;
  String userName ;
  String commentDate ;
  String reply_to;
  var commentImage ;

  Comment({
    super.key,
    required this.userImage,
    required this.commentText,
    required this.userName,
    required this.commentDate,
    required this.reply_to,
    this.commentImage = "",
});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(50, 0, 20, 0),
      //color: Colors.red,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // User Info
          Row(
            children: [
              CircleAvatar(
                backgroundImage: userImage,
                radius: 14,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: SizedBox(
                        width: context.width * 0.45,
                        child: Text(
                          userName,
                          style: TextStyle(
                            fontSize: 10,
                          ),
                          maxLines: 1,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(10, 5, 0, 0),
                      child: Text(
                        commentDate,
                        style: TextStyle(
                          fontSize: 10,
                          color: Colors.grey,
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
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Text(
              "@$reply_to\n$commentText",
              style: TextStyle(
                fontSize: 11,
              ),
            ),
          ),

          // Comment Img
          (commentImage != "")
              ? Padding(
                  padding: const EdgeInsets.fromLTRB(15, 10, 0, 0),
                  child: SizedBox(
                    width: context.width - 35,
                    child: FittedBox(
                      child: commentImage,
                    ),
                  ),
                )
              : Container(),
        ],
      ),
    );
  }
}
