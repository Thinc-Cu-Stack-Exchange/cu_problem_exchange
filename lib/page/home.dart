import 'package:flutter/material.dart';
import 'package:cu_problem_exchange/widget/tabbar.dart';
class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: const [
            Topbar(tag: 'Home'),

          ],
        ),
      ),
    );
  }
}



