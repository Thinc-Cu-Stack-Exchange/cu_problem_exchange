import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:photo_view/photo_view_gallery.dart';

// Full screen view of images
class FullImages extends GetView<FullImagesController> {
  const FullImages({super.key});

  @override
  Widget build(BuildContext context) {
    controller.currentIndex.value = Get.arguments.initialIndex + 1;
    return Scaffold(
      body: Container(
        constraints: BoxConstraints.expand(
          height: context.height,
        ),
        child: Stack(
          children: <Widget>[
            PhotoViewGallery.builder(
              pageController:
                  PageController(initialPage: Get.arguments.initialIndex),
              scrollPhysics: const BouncingScrollPhysics(),
              builder: (context, index) => PhotoViewGalleryPageOptions(
                  imageProvider: Get.arguments.imageList[index]),
              itemCount: Get.arguments.imageList.length,
              onPageChanged: controller.onPageChanged,
            ),
            Obx(() => Align(
                alignment: Alignment.bottomRight,
                child: Container(
                  decoration: const BoxDecoration(
                      color: Colors.black26,
                      borderRadius: BorderRadius.all(Radius.circular(20))),
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  margin: const EdgeInsets.only(bottom: 20, right: 10),
                  child: Text(
                    "${controller.currentIndex}/${Get.arguments.imageList.length}",
                    style: const TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ))),
            Align(
                alignment: Alignment.topLeft,
                child: Padding(
                  padding: const EdgeInsets.only(top: 45, left: 15),
                  child: TextButton(
                    style: TextButton.styleFrom(
                        backgroundColor: Colors.black26,
                        shape: const CircleBorder()),
                    onPressed: controller.onClosePressed,
                    child: const Icon(
                      Icons.close,
                      color: Colors.white,
                      size: 20,
                    ),
                  ),
                ))
          ],
        ),
      ),
    );
  }
}

class FullImagesBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => FullImagesController());
  }
}

class FullImagesController extends GetxController {
  final currentIndex = 1.obs;

  void onPageChanged(int index) {
    currentIndex.value = index + 1;
  }

  void onClosePressed() {
    Get.back();
  }
}
