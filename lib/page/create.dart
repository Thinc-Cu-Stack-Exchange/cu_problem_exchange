import 'dart:io';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:photo_view/photo_view.dart';

import '../route_names.dart';

class Create extends GetView<CreateController> {
  const Create({super.key});

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
                    child: ListView(
                      padding: const EdgeInsets.only(bottom: 10),
                      children: [
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
                        ),
                        Obx(() => controller.imageList.isNotEmpty
                            ? Stack(alignment: Alignment.topRight, children: [
                                CarouselSlider.builder(
                                    itemCount: controller.imageList.length,
                                    itemBuilder: (ctx, index, _) => PhotoView(
                                          backgroundDecoration: BoxDecoration(
                                              color: context
                                                  .theme.backgroundColor),
                                          imageProvider:
                                              controller.imageList[index],
                                          minScale:
                                              PhotoViewComputedScale.covered,
                                        ),
                                    options: CarouselOptions(
                                        viewportFraction: 1,
                                        onPageChanged:
                                            controller.imagePageChanged)),
                                Text(
                                    "${controller.showingImageIndex}/${controller.imageList.length}",
                                    textAlign: TextAlign.right,
                                    style:
                                        const TextStyle(color: Colors.white)),
                              ])
                            : Container()),
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

  final showingImageIndex = 1.obs;

  final titleController = TextEditingController();
  final contentController = TextEditingController();

  final bottomSheet = const ImagePickerBottomSheet();

  void closePressed() {
    Get.offNamed(RouteNames.home);
  }

  void addPhotoPressed() {
    Get.bottomSheet(bottomSheet);
  }

  void imagePageChanged(int index, CarouselPageChangedReason _) {
    showingImageIndex.value = index + 1;
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
    titleController.dispose();
    contentController.dispose();
    super.onClose();
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
