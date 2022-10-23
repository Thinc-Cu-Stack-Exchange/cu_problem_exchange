// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';
import 'package:get/get.dart';

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

  final inputController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(15, 20, 20, 10),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(18),
                  color: const Color(0xffD2D2D2),
                ),
                child: TextField(
                  controller: inputController,
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
                      suffixIcon: IconButton(
                        icon: const Icon(
                          Icons.close,
                          size: 20,
                        ),
                        onPressed: () => inputController.clear(),
                      )),
                  maxLines: 1,
                  textInputAction: TextInputAction.done,
                ),
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
    //   Scaffold(
    //     body: SafeArea(child: Column(
    //       children: [
    //         Padding(
    //           padding: EdgeInsets.all(0),
    //           child:
    //         )
    //       ],
    // )),
    //   );
  }
}

class FindBindings extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => FindController());
  }

}

class FindController extends GetxController{

}
