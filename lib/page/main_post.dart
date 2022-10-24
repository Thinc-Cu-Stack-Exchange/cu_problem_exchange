import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MainPost extends GetView<MainPostController> {
  const MainPost({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(),
    );
  }
}

class MainPostBindings extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => MainPostController());
  }

}

class MainPostController extends GetxController{

}

