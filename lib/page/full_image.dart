import 'package:cu_problem_exchange/widget/images_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:photo_view/photo_view_gallery.dart';

// Full screen view of images
class FullImages extends GetView<FullImagesController> {
  const FullImages({super.key});

  @override
  Widget build(BuildContext context) {
    FullImageArguments arguments = Get.arguments;
    controller.currentIndex.value = arguments.initialIndex;
    return Scaffold(
      body: Container(
        constraints: BoxConstraints.expand(
          height: context.height,
        ),
        child: Stack(
          children: <Widget>[
            PhotoViewGallery.builder(
              pageController:
                  PageController(initialPage: arguments.initialIndex),
              scrollPhysics: const BouncingScrollPhysics(),
              builder: (context, index) => PhotoViewGalleryPageOptions(
                  imageProvider: arguments.imageList[index]),
              itemCount: arguments.imageList.length,
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
                    "${controller.currentIndex}/${arguments.imageList.length}",
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

class FullImageArguments {
  final RxList<ImageProvider> imageList;
  final int initialIndex;

  FullImageArguments({required this.imageList, required this.initialIndex});
}