import 'dart:math';

import 'package:cu_problem_exchange/widget/tabbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../route_names.dart';

class      CreateTag extends StatelessWidget {
  String tagname;
  var maxLength = 20;
  var iconSize = 20.0;

  CreateTag({super.key, required this.tagname});

  @override
  Widget build(BuildContext context) {
    if (tagname.length > maxLength) {
      tagname = tagname.substring(0, maxLength);
      tagname += "...";
    }
    return Padding(
      padding: const EdgeInsets.fromLTRB(45, 0, 0, 0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            height: 30,
            // width: margin_inside + (tagname.length)*7 + margin_inside,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(18),
                color: const Color(0xffe897af),
              ),
              child: TextButton(
                onPressed: () {},
                style: ButtonStyle(
                    alignment: Alignment.centerLeft, // <-- had to set alignment
                    padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                      const EdgeInsets.symmetric(horizontal: 20),
                    ),

                ),
                child: Text(
                  tagname,
                  style: const TextStyle(
                    fontSize: 12,
                    color: Color(0xffffffff),
                  ),
                  maxLines: 1,
                  textAlign: TextAlign.left,
                ),
              ),
            ),
          ),
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.delete,
                size: iconSize,
              )
          )
        ],
      ),
    );
  }

  Size _textSize(String text, TextStyle style) {
    final TextPainter textPainter = TextPainter(
        text: TextSpan(text: text, style: style),
        maxLines: 1,
        textDirection: TextDirection.ltr)
      ..layout(minWidth: 0, maxWidth: double.infinity);
    return textPainter.size;
  }
}


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
            drawer: SizedBox(
                width: drawerWidth,
                child: Drawer(
                  child: ListView(
                    children: [
                      const SizedBox(
                        height: 8,
                      ),
                      const ListTile(
                        title: Text(
                          "Recently Visited",
                          style: TextStyle(
                            fontSize: 18,
                            color: Color(0xff000000),
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      Column(
                        children: [
                          CreateTag(tagname: "tag1"),
                          CreateTag(tagname: "tag2 psls"),
                          CreateTag(tagname: "ooooooooooooooooooooooooooo"),
                          CreateTag(
                              tagname: "pslspslspslspslspslspslspslspslspslspslspslspslspslspsls")
                        ],
                      ),
                      const ListTile(
                        title: Text(
                          "Your Followed Tag",
                          style: TextStyle(
                            fontSize: 18,
                            color: Color(0xff000000),
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      Column(
                        children: [
                          CreateTag(tagname: "followed tag1"),
                          CreateTag(tagname: "fol tag2"),
                          CreateTag(tagname: "P"),
                          CreateTag(tagname: "S"),
                          CreateTag(tagname: "L"),
                          CreateTag(tagname: "S"),
                          CreateTag(tagname: "Tasa"),
                        ],
                      ),
                    ],
                  ),
                )
            ),
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
