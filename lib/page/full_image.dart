import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:photo_view/photo_view_gallery.dart';

// Full screen view of images
class FullImages extends GetView<FullImagesController> {
  const FullImages({super.key});

  @override
  Widget build(BuildContext context) {
    
    controller.currentIndex.value = Get.arguments.initialIndex+1;
    return Scaffold(
      body: Container(
        constraints: BoxConstraints.expand(
          height: context.height,
        ),
        child: Stack(
          alignment: Alignment.bottomRight,
          children: <Widget>[
            PhotoViewGallery.builder(
              pageController: PageController(initialPage: Get.arguments.initialIndex),
              scrollPhysics: const BouncingScrollPhysics(),
              builder: (context, index) => PhotoViewGalleryPageOptions(
                  imageProvider: Get.arguments.imageList[index]),
              itemCount: Get.arguments.imageList.length,
              onPageChanged: controller.onPageChanged,
            ),
            Obx(() => Container(
                  padding: const EdgeInsets.all(20.0),
                  child: Text(
                    "${controller.currentIndex}/${Get.arguments.imageList.length}",
                    style: const TextStyle(
                      color: Colors.white,
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
}
