import 'package:flutter/material.dart';

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