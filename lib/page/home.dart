import 'package:cu_problem_exchange/widget/tabbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../route_names.dart';

class Home extends GetView<HomeController> {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () async => false,
        child: Scaffold(
            appBar: const CustomTopBar(
              tag: 'Home',
            ),
            drawer: const Drawer(),
            bottomNavigationBar: const CustomBotBar(),
            backgroundColor: const Color(0xffE7E7E7),
            floatingActionButtonLocation:
                FloatingActionButtonLocation.centerDocked,
            floatingActionButton: FloatingActionButton(
              onPressed: controller.createPressed,
              backgroundColor: const Color(0xffe897af),
              child: const Icon(
                Icons.add,
              ),
            )));
  }
}

class HomeController extends GetxController {
  void createPressed() {
    Get.toNamed(RouteNames.create);
  }
}

class HomeBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => HomeController());
  }
}
