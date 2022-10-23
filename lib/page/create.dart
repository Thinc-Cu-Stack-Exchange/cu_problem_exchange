import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

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
                    child: Obx(() => ListView.builder(
                          itemCount: 2 + controller.imageList.length,
                          itemBuilder: (BuildContext context, int index) {
                            if (index == 0) {
                              return TextField(
                                controller: controller.titleController,
                                style: const TextStyle(
                                    fontSize: 24, fontWeight: FontWeight.bold),
                                decoration: const InputDecoration(
                                  border: InputBorder.none,
                                  hintText: 'Title',
                                ),
                                maxLines: null,
                              );
                            } else if (index == 1) {
                              return TextField(
                                controller: controller.contentController,
                                style: const TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.normal),
                                decoration: const InputDecoration(
                                  border: InputBorder.none,
                                  hintText: 'Content',
                                ),
                                maxLines: null,
                                keyboardType: TextInputType.multiline,
                              );
                            } else {
                              return Image(
                                  image: controller.imageList[index - 2]);
                            }
                          },
                        )))),
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
  RxList<FileImage> imageList = RxList<FileImage>();

  final titleController = TextEditingController();
  final contentController = TextEditingController();

  final bottomSheet = const ImagePickerBottomSheet();

  void closePressed() {
    Get.offNamed(RouteNames.home);
  }

  void addPhotoPressed() {
    Get.bottomSheet(bottomSheet);
  }

  void pickImageFromCamera() async {
    XFile? file = await ImagePicker().pickImage(source: ImageSource.camera);
    addImage(file);
    Get.back();
  }

  void pickImageFromGallery() async {
    XFile? file = await ImagePicker().pickImage(source: ImageSource.gallery);
    addImage(file);
    Get.back();
  }

  void addImage(XFile? file) {
    if (file == null) {
      return;
    }

    imageList.add(FileImage(File(file.path)));
  }

  @override
  void onClose() {
    titleController.dispose();
    contentController.dispose();
    super.onClose();
  }
}

class CreateBinding implements Bindings {
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
