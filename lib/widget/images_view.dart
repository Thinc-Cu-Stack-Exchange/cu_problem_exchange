import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../page/full_image.dart';
import '../route_names.dart';

class ImagesView extends GetWidget<ImagesViewController> {
  final Color backgroundColor;
  final RxList<ImageProvider> imageList;

  const ImagesView(
      {super.key,
      required this.imageList,
      this.backgroundColor = Colors.white});

  @override
  Widget build(BuildContext context) {
    controller.imageList = imageList;
    return Obx(() => controller.imageList.isNotEmpty
        ? Stack(alignment: Alignment.topRight, children: [
            CarouselSlider.builder(
                itemCount: controller.imageList.length,
                itemBuilder: (ctx, index, _) =>
                    Stack(fit: StackFit.expand, children: [
                      Image(
                        image: controller.imageList[index],
                        fit: BoxFit.contain,
                      ),
                      Material(
                        color: Colors.transparent,
                        child: InkWell(
                          onTap: controller.onImageTapped,
                        ),
                      ),
                    ]),
                // PhotoView(
                //   backgroundDecoration:
                //   BoxDecoration(color: backgroundColor),
                //   imageProvider: controller.imageList[index],
                //   minScale: PhotoViewComputedScale.contained,
                // )),
                options: CarouselOptions(
                    viewportFraction: 1,
                    onPageChanged: controller.imagePageChanged)),
            Container(
                padding: const EdgeInsets.symmetric(horizontal: 5),
                decoration: const BoxDecoration(
                    color: Colors.black26,
                    borderRadius: BorderRadius.all(Radius.circular(20))),
                child: Text(
                    "${controller.showingImageIndex}/${controller.imageList.length}",
                    textAlign: TextAlign.right,
                    style: const TextStyle(
                      color: Colors.white,
                    ))),
          ])
        : Container());
  }
}

class ImagesViewController extends GetxController {
  final showingImageIndex = 1.obs;
  var imageList = <ImageProvider>[].obs;

  void imagePageChanged(int index, CarouselPageChangedReason _) {
    showingImageIndex.value = index + 1;
  }

  void onImageTapped() {
    Get.toNamed(RouteNames.fullImage,
        arguments: FullImageArguments(
            imageList: imageList, initialIndex: showingImageIndex.value));
  }
}
