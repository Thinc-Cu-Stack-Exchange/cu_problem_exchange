import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:photo_view/photo_view.dart';

class ImagesView extends GetWidget<ImagesViewController> {
  final RxList<FileImage> imageList;

  const ImagesView({super.key, required this.imageList});

  @override
  Widget build(BuildContext context) {
    return Obx(() => imageList.isNotEmpty
        ? Stack(alignment: Alignment.topRight, children: [
            CarouselSlider.builder(
                itemCount: imageList.length,
                itemBuilder: (ctx, index, _) => PhotoView(
                      backgroundDecoration:
                          BoxDecoration(color: context.theme.backgroundColor),
                      imageProvider: imageList[index],
                      minScale: PhotoViewComputedScale.covered,
                    ),
                options: CarouselOptions(
                    viewportFraction: 1,
                    onPageChanged: controller.imagePageChanged)),
            Container(
                padding: const EdgeInsets.symmetric(horizontal: 5),
                decoration: const BoxDecoration(
                    color: Colors.black26,
                    borderRadius: BorderRadius.all(Radius.circular(20))),
                child:
                    Text("${controller.showingImageIndex}/${imageList.length}",
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

  void imagePageChanged(int index, CarouselPageChangedReason _) {
    showingImageIndex.value = index + 1;
  }
}
