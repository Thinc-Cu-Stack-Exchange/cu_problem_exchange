import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../route_names.dart';
import '../widget/images_view.dart';

class Create extends GetView<CreateController> {
  bool showSearchResult = false;
  Create({super.key});

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
                // Clost Icon
                IconButton(
                  icon: const Icon(Icons.close),
                  onPressed: controller.closePressed,
                ),
                // Next Button
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(horizontal: 24),
                      shape: const RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.all(Radius.circular(40.0)))),
                  onPressed: () {},
                  child: const Text("NEXT"),
                )
              ],
            ),
            Expanded(
                child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: ListView(
                      padding: const EdgeInsets.only(bottom: 10),
                      children: [
                        // @Tag
                        TextField(
                          controller: controller.tagController,
                          style: const TextStyle(
                              fontSize: 24, fontWeight: FontWeight.bold),
                          decoration: const InputDecoration(
                            border: InputBorder.none,
                            hintText: '@Tag',
                          ),
                          maxLines: 1,
                          // onTap: () {
                          //   showSearchResult = true;
                          // },
                        ),

                        // Title
                        Stack(
                          children: [
                            Column(
                              children: [
                                TextField(
                                  controller: controller.titleController,
                                  style: const TextStyle(
                                      fontSize: 21, fontWeight: FontWeight.bold),
                                  decoration: const InputDecoration(
                                    border: InputBorder.none,
                                    hintText: 'Title',
                                  ),
                                  maxLines: null,
                                ),

                                // Text
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
                                ),

                                // Image
                                ImagesView(
                                  imageList: controller.imageList,
                                  backgroundColor: context.theme.backgroundColor,
                                ),
                              ],
                            ),
                            (showSearchResult) ? Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                CreateSearchResult(result: "result1"),
                                CreateSearchResult(result: "sugjjoigjoif"),
                              ],
                            ) : Container()


                          ],
                        ),
                      ],
                    ))),
            ElevatedButton(
                onPressed: controller.addPhotoPressed,
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
  final imageList = RxList<FileImage>();

  final titleController = TextEditingController();
  final contentController = TextEditingController();
  final tagController = TextEditingController();
  final bottomSheet = const ImagePickerBottomSheet();

  void closePressed() {
    Get.offNamed(RouteNames.home);
  }

  void addPhotoPressed() {
    Get.bottomSheet(bottomSheet);
  }

  void pickImageFromCamera() async {
    final file = await ImagePicker().pickImage(source: ImageSource.camera);
    if (file == null) {
      return;
    }
    imageList.add(FileImage(File(file.path)));
    Get.back();
  }

  void pickImageFromGallery() async {
    final files = await ImagePicker().pickMultiImage();
    imageList.addAll(files.map((file) => FileImage(File(file.path))));
    Get.back();
  }

  @override
  void onClose() {
    tagController.dispose();
    titleController.dispose();
    contentController.dispose();
    super.onClose();
  }

  void editTag({required String result}) {
    tagController.text = result;
  }

}

class CreateBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => CreateController());
  }
}

class ImagePickerBottomSheet extends StatelessWidget {
  const ImagePickerBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<CreateController>();
    return Ink(
        color: context.theme.primaryColor,
        child: Wrap(
          children: <Widget>[
            ListTile(
                leading: const Icon(
                  Icons.photo_library_outlined,
                  color: Colors.white,
                ),
                title: const Text(
                  'From Gallery',
                  style: TextStyle(color: Colors.white),
                ),
                onTap: controller.pickImageFromGallery),
            ListTile(
              leading:
                  const Icon(Icons.photo_camera_outlined, color: Colors.white),
              title: const Text(
                'From Camera',
                style: TextStyle(color: Colors.white),
              ),
              onTap: controller.pickImageFromCamera,
            ),
          ],
        ));
  }
}

class CreateSearchResult extends StatelessWidget {
  final String result;
  CreateSearchResult({
    super.key,
    required this.result,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: SizedBox(
        height: 40,
        width: context.width*0.85,
        child: TextButton(
            onPressed: () => Get.find<CreateController>().editTag(result: result) ,
            child: Container(
              alignment: Alignment.centerLeft,
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                result,
                style: TextStyle(
                    fontSize: 15,
                    color: Colors.black
                ),
                maxLines: 1,
              ),
            )
        ),
      ),
    );
  }
}