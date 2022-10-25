import 'package:flutter/material.dart';

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