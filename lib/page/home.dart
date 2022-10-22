import 'package:flutter/material.dart';
import 'package:cu_problem_exchange/widget/tabbar.dart';
import 'package:get/get.dart';

class Home extends GetView<HomeController> {
  const Home({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomTopBar(tag: 'Home',),
      drawer: const Drawer(

      ),
      bottomNavigationBar: CustomBotBar(),

      backgroundColor: const Color(0xffE7E7E7),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: (){},
        backgroundColor: const Color(0xffe897af),
        child : const Icon(
          Icons.add,
        ),
      )
    );
  }
}

class HomeController extends GetxController{

}

class HomeBindings implements Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => HomeController());
  }
}
