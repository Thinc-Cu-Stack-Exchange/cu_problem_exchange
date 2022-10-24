import 'package:cu_problem_exchange/page/account.dart';
import 'package:cu_problem_exchange/page/create.dart';
import 'package:cu_problem_exchange/page/find.dart';
import 'package:cu_problem_exchange/page/full_image.dart';
import 'package:cu_problem_exchange/page/home.dart';
import 'package:cu_problem_exchange/page/main_post.dart';
import 'package:cu_problem_exchange/route_names.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() => runApp(GetMaterialApp(
      theme: ThemeData(
        // Define the default brightness and colors.
        primaryColor: const Color(0xffe897af),
        backgroundColor: const Color(0xffE7E7E7),

        elevatedButtonTheme: ElevatedButtonThemeData(
          style: TextButton.styleFrom(
              backgroundColor: const Color(0xffe897af),
              foregroundColor: Colors.white),
        ),
      ),
      initialRoute: RouteNames.home,
      getPages: [
        GetPage(
            name: RouteNames.home,
            page: () => const Home(),
            binding: HomeBindings()),
        GetPage(
            name: RouteNames.create,
            page: () => const Create(),
            binding: CreateBindings()),
        GetPage(
            name: RouteNames.find, page: () => Find(), binding: FindBindings()),
        GetPage(
            name: RouteNames.account,
            page: () => Account(),
            binding: AccountBindings()),
        GetPage(
          name: RouteNames.mainPost,
          page: () => MainPost(),
          binding: MainPostBindings(),
        ),
        GetPage(
          name: RouteNames.fullImage,
          page: () => const FullImages(),
          binding: FullImagesBindings()
        )
      ],
    ));
