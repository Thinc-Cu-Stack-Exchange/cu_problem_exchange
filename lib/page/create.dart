import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../route_names.dart';

class Create extends GetView<CreateController> {
  const Create({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  icon: const Icon(Icons.close),
                  onPressed: controller.closePressed,
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(horizontal: 24),
                      shape: const RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.all(Radius.circular(40.0)))),
                  onPressed: () {},
                  child: const Text("Next"),
                )
              ],
            ),
            Expanded(
                child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Column(children:  [
                      TextField(
                        controller: controller.titleController,
                        style: const TextStyle(
                            fontSize: 24, fontWeight: FontWeight.bold),
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Title',
                        ),
                        maxLines: null,
                      ),
                      TextField(
                        controller: controller.contentController,
                        style: const TextStyle(
                            fontSize: 18, fontWeight: FontWeight.normal),
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Content',
                        ),
                        maxLines: null,
                        keyboardType: TextInputType.multiline,
                      )
                    ]))),
            ElevatedButton(
                onPressed: () {},
                child: Padding(
                    padding: const EdgeInsets.all(15),
                    child: Row(
                      children: const [
                        Padding(
                            padding: EdgeInsets.only(right: 20),
                            child: Icon(
                              Icons.add_photo_alternate_outlined,
                              size: 40,
                            )),
                        Text(
                          "Photo",
                          style: TextStyle(
                              fontSize: 22, fontWeight: FontWeight.normal),
                        )
                      ],
                    )))
          ],
        ),
      ),
    );
  }
}

class CreateController extends GetxController {
  final titleController = TextEditingController();
  final contentController = TextEditingController();

  void closePressed(){
    Get.offNamed(RouteNames.home);
  }

  @override
  void onClose() {
    titleController.dispose();
    contentController.dispose();
    super.onClose();
  }
}

class CreateBinding implements Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => CreateController());
  }
}