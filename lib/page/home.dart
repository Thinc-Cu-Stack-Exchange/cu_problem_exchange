import 'dart:math';

import 'package:cu_problem_exchange/widget/images_view.dart';
import 'package:cu_problem_exchange/widget/post.dart';
import 'package:cu_problem_exchange/widget/tabbar.dart';
import 'package:cu_problem_exchange/widget/drawer.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../route_names.dart';


class Home extends GetView<HomeController> {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final drawerWidth = context.width * 0.75;
    return WillPopScope(
        onWillPop: () async => false,
        child: Scaffold(
            appBar: const CustomTopBar(
              tag: 'Home',
            ),
            drawer: CreateDrawer(drawerWidth: drawerWidth,),

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
            ),
            body: ListView(
              children: [
                CreatePost(
                  userImage : AssetImage("assets/sample_user.png"),
                  postTag : "PasaThai",
                  userName : "Poster1123456789234567823456789123456783456782345678",
                  postDate : "12/12/21",
                  postTitle : "Possakarnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnn",
                  postText : "PsLs \nPsLs \nPSLSsafff\npsps", // optional
                  postImage: Image.asset("assets/sample_image.jpg"),
                  postLiked : 26,
                  postCommentCount : 69,
                ),
                CreatePost(
                  userImage : AssetImage("assets/sample_user.png"),
                  postTag : "PasaThai",
                  userName : "Poster1123456789234567823456789123456783456782345678",
                  postDate : "12/12/21",
                  postTitle : "Possakarnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnn",
                  postLiked : 26,
                  postCommentCount : 69,
                ),
                CreatePost(
                  userImage : AssetImage("assets/sample_user.png"),
                  postTag : "PasaThai",
                  userName : "Poster1123456789234567823456789123456783456782345678",
                  postDate : "12/12/21",
                  postTitle : "Possakarnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnn",
                  postText : "PsLs \nPsLs \nPSLS", // optional
                  postLiked : 26,
                  postCommentCount : 69,
                ),


              ],
            ),
        )
    );
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
    Get.create(() => ImagesViewController());
  }
}
