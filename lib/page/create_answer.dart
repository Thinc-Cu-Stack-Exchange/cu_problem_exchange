import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import '../route_names.dart';
import '../widget/images_view.dart';

class CreateAnswer extends StatelessWidget {
  const CreateAnswer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Scaffold(
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
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: ListView(
                        padding: const EdgeInsets.only(bottom: 10),
                        children: [
                          TextField(
                            //controller: controller.contentController,
                            style: const TextStyle(
                                fontSize: 18, fontWeight: FontWeight.normal),
                            decoration: const InputDecoration(
                              border: InputBorder.none,
                              hintText: 'Answer',
                            ),
                            maxLines: null,
                            keyboardType: TextInputType.multiline,
                          ),
                          // ImagesView(
                          //   imageList: controller.imageList,
                          //   backgroundColor: context.theme.backgroundColor,
                          // ),
                        ],
                      ))),
              ElevatedButton(
                  onPressed: () {} ,
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
      ),
    );
  }
}

class CreateAnswerBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => CreateAnswerController());
  }
}

class CreateAnswerController extends GetxController {}
