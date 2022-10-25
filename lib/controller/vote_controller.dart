import 'package:get/get.dart';

class VoteController{
  final upvotes = 0.obs;
  final upvoted = false.obs;
  final downvoted = false.obs;

  int get totalUpvotes => upvotes.value + (upvoted.value ? 1 : 0) + (downvoted.value ? -1 : 0);

  void toggleUpvote(){
    downvoted.value = false;
    upvoted.value = !upvoted.value;
  }

  void toggleDownvote(){
    upvoted.value = false;
    downvoted.value = !downvoted.value;
  }
}