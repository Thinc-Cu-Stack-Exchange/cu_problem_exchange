import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../route_names.dart';
import '../widget/drawer.dart';
import '../widget/images_view.dart';
import '../widget/post/answer.dart';
import '../widget/post/post.dart';
import '../widget/post/post_bottom.dart';
import '../widget/tabbar.dart';

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
          drawer: CreateDrawer(
            drawerWidth: drawerWidth,
          ),
          bottomNavigationBar: const CustomBotBar(),
          backgroundColor: const Color(0xffE7E7E7),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerDocked,
          floatingActionButton: FloatingActionButton(
            onPressed: controller.createPressed,
            backgroundColor: const Color(0xffC78196),
            child: const Icon(
              Icons.add,
            ),
          ),
          body: ListView(
            children: [
              Post(
                userImage: AssetImage("assets/sample_user.png"),
                postTag: "PasaThai",
                userName:
                    "Poster1123456789234567823456789123456783456782345678",
                postDate: "12/12/21",
                postTitle:
                    "Possakarnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnn",
                postText: "PsLs \nPsLs \nPSLSsafff\npsps",
                // optional
                postImage: [AssetImage("assets/sample_image.jpg")].obs,
                postVoted: 26,
                postAnswerCount: 69,
              ),
              Post(
                userImage: AssetImage("assets/sample_user.png"),
                postTag: "PasaThai",
                userName:
                    "Poster1123456789234567823456789123456783456782345678",
                postDate: "12/12/21",
                postTitle:
                    "Possakarnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnn",
                postVoted: 26,
                postAnswerCount: 69,
                postImage: <ImageProvider>[].obs,
              ),
              Post(
                userImage: AssetImage("assets/sample_user.png"),
                postTag: "PasaThai",
                userName:
                    "Poster1123456789234567823456789123456783456782345678",
                postDate: "12/12/21",
                postTitle:
                    "Possakarnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnn",
                postText: "PsLs \nPsLs \nPSLS",
                // optional
                postVoted: 26,
                postAnswerCount: 69,
                postImage: <ImageProvider>[].obs,
              ),
            ],
          ),
        ));
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

    // widget controllers
    Get.create(() => ImagesViewController());
    Get.create(() => PostController());
    Get.create(() => PostBottomController());
    Get.create(() => AnswerController());
  }
}
