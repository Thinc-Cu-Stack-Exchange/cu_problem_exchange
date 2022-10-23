import 'package:cu_problem_exchange/page/account.dart';
import 'package:cu_problem_exchange/page/create.dart';
import 'package:cu_problem_exchange/page/find.dart';
import 'package:cu_problem_exchange/page/home.dart';
import 'package:cu_problem_exchange/route_names.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() => runApp(GetMaterialApp(
      theme: ThemeData(
        // Define the default brightness and colors.
        primaryColor: const Color(0xffe897af),

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
            page: () => const Account(),
            binding: AccountBindings()),
      ],
    ));
