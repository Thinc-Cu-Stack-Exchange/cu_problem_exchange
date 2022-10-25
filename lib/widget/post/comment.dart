import 'package:flutter/material.dart';

class Comment extends StatelessWidget {
  const Comment({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(5),
      color: Colors.red,
      child: Text(
        "Reply",
      ),
    );
  }
}
