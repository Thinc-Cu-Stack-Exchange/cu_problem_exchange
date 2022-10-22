import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:cu_problem_exchange/page/home.dart';

void main() => runApp(MaterialApp(
    theme: ThemeData(
      // Define the default brightness and colors.
      primaryColor: const Color.fromARGB(255, 255, 130, 220),

      elevatedButtonTheme: ElevatedButtonThemeData(
        style: TextButton.styleFrom(
            backgroundColor: const Color.fromARGB(255, 255, 130, 220),
            foregroundColor: Colors.black),
      ),
    ),
    home: const Create()));
