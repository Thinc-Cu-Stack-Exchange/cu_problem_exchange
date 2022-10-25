import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:cu_problem_exchange/widget/images_view.dart';

class CreateReply extends StatelessWidget {
  String reply_to = "meen";
  CreateReply({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.theme.backgroundColor,
      body: SafeArea(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  icon: const Icon(Icons.close),
                  onPressed: () {},
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(horizontal: 24),
                      shape: const RoundedRectangleBorder(
                          borderRadius:
                          BorderRadius.all(Radius.circular(40.0)))),
                  onPressed: () {},
                  child: const Text("POST"),
                )
              ],
            ),
            Expanded(
                child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: ListView(
                      padding: const EdgeInsets.only(bottom: 10),
                      children: [
                        Text(
                          "@$reply_to",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 15),
                          child: Divider(
                            height: 2,
                            color: Colors.black26,
                          ),
                        ),
                        TextField(
                          //controller: controller.contentController,
                          style: const TextStyle(
                              fontSize: 18, fontWeight: FontWeight.normal),
                          decoration: const InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Reply',
                          ),
                          maxLines: null,
                          keyboardType: TextInputType.multiline,
                        ),
                      ],
                    )
                )
            ),
          ],
        ),
      ),
    );
  }
}

class CreateReplyBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => CreateReplyController());
  }
}

class CreateReplyController extends GetxController {}


