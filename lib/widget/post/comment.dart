import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Comment extends StatelessWidget {
  var userImg = AssetImage("assets/sample_user.png");
  String commentText = "commenttesssssssssssssssssssssssssssssssssssssssssssssssssxt1";
  String userName = "jlksgij";
  String commentDate = "12/12/12";
  Comment({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 50),
      //color: Colors.red,
      child: Row(
        children: [
          CircleAvatar(
            backgroundImage: userImg,
            radius: 10,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              children: [
                SizedBox(
                  //width: context.width * 0.6,
                  child: Text(
                    userName,
                    style: TextStyle(
                      fontSize: 10,
                    ),
                    maxLines: 1,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Text(
                    commentDate,
                    style: TextStyle(
                      fontSize: 10,
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
