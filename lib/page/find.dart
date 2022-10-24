// ignore_for_file: camel_case_types
import 'package:colorful_safe_area/colorful_safe_area.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../route_names.dart';

class CreateRecentSearch extends StatelessWidget {
  final String textRecentSearch;

  const CreateRecentSearch({super.key, required this.textRecentSearch});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(0),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 0, horizontal: 10),
              child: Icon(
                Icons.history,
                size: 20,
              ),
            ),
            Expanded(
              child: TextButton(
                onPressed: () {},
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    textRecentSearch,
                    style: const TextStyle(
                      fontSize: 15,
                      color: Color(0xff000000),
                    ),
                  ),
                ),
              ),
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.delete,
                size: 20,
              ),
            )
          ],
        ),
      ),
    );
  }
}

class CreateResultSearch extends StatelessWidget {
  final String textResultSearch;

  const CreateResultSearch({super.key, required this.textResultSearch});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(0),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 0, horizontal: 10),
              child: Icon(
                Icons.search,
                size: 20,
              ),
            ),
            Expanded(
              child: TextButton(
                onPressed: () {},
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    textResultSearch,
                    style: const TextStyle(
                      fontSize: 15,
                      color: Color(0xff000000),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Find extends GetView<FindController> {
  Find({Key? key}) : super(key: key);
  final dataSearch = ["s1", "s2", "s3"];
  final dataBase = ["a", "b", "c", "cca", "bc", "ac"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffffffff),
      body: ColorfulSafeArea(
        color: Color(0xffe897af),
        child: Column(
          children: [
            Container(
              // Header
              color: const Color(0xffe897af),
              child: Align(
                alignment: Alignment.centerLeft,
                child: IconButton(
                    onPressed: controller.closePressed,
                    icon: const Icon(
                      Icons.close,
                      color: Color(0xffffffff),
                    )),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(15, 20, 20, 10),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(18),
                  color: const Color(0xffE7E7E7),
                ),
                child: Obx(() => TextField(
                      controller: controller.inputController,
                      textAlignVertical: TextAlignVertical.center,
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: "Search",
                          hintStyle: const TextStyle(
                            fontSize: 15,
                          ),
                          prefixIcon: const Icon(
                            Icons.search,
                            size: 20,
                          ),
                          suffixIcon: controller.inputText.isEmpty
                              ? null
                              : IconButton(
                                  icon: const Icon(
                                    Icons.close,
                                    size: 20,
                                  ),
                                  onPressed: () =>
                                      controller.inputController.clear(),
                                )),
                      maxLines: 1,
                      textInputAction: TextInputAction.done,
                    )),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(3),
              child: Column(
                children: [
                  CreateRecentSearch(textRecentSearch: dataSearch[0]),
                  CreateResultSearch(textResultSearch: dataBase[0])
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class FindBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => FindController());
  }
}

class FindController extends GetxController {
  final inputController = TextEditingController();
  final inputText = "".obs;

  void closePressed() {
    Get.offNamed(RouteNames.home);
  }

  @override
  void onInit() {
    super.onInit();
    inputController.addListener(() => inputText.value = inputController.text);
  }

  @override
  void onClose() {
    inputController.dispose();
    super.onClose();
  }
}
