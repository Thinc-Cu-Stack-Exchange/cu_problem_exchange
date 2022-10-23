import 'dart:math';

import 'package:cu_problem_exchange/widget/tabbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../route_names.dart';

class createTag extends StatelessWidget {
  var tagname;
  var max_length = 20;
  var iconSize = 20.0;

  createTag({super.key, required this.tagname});

  @override
  Widget build(BuildContext context) {
    if (tagname.length > max_length) {
      tagname = tagname.substring(0, max_length);
      tagname += "...";
    }
    return Padding(
      padding: EdgeInsets.fromLTRB(45, 0, 0, 0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            height: 30,
            // width: margin_inside + (tagname.length)*7 + margin_inside,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(18),
                color: Color(0xffe897af),
              ),
              child: TextButton(
                onPressed: () {},
                style: ButtonStyle(
                    alignment: Alignment.centerLeft, // <-- had to set alignment
                    padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                      EdgeInsets.symmetric(horizontal: 20),
                    ),

                ),
                child: Text(
                  tagname,
                  style: TextStyle(
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
    return WillPopScope(
        onWillPop: () async => false,
        child: Scaffold(
            appBar: const CustomTopBar(
              tag: 'Home',
            ),
            drawer: Container(
                width: MediaQuery.of(context).size.width * 0.75,
                child: Drawer(
                  child: ListView(
                    children: [
                      SizedBox(
                        height: 8,
                      ),
                      ListTile(
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
                          createTag(tagname: "tag1"),
                          createTag(tagname: "tag2 psls"),
                          createTag(tagname: "123456789012345678901234567890"),
                          createTag(
                              tagname: "pslspslspslspslspslspslspslspslspslspslspslspslspslspsls")
                        ],
                      ),
                      ListTile(
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
                          createTag(tagname: "followed tag1"),
                          createTag(tagname: "fol tag2"),
                          createTag(tagname: "P"),
                          createTag(tagname: "S"),
                          createTag(tagname: "L"),
                          createTag(tagname: "S"),
                          createTag(tagname: "Tasa"),
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
