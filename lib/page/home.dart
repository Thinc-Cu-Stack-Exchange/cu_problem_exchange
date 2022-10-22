import 'package:flutter/material.dart';
import 'package:cu_problem_exchange/widget/tabbar.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomTopBar(tag: 'Home',),
      drawer: Drawer(

      ),
      bottomNavigationBar: CustomBotBar(),

      backgroundColor: Color(0xffE7E7E7),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        child : Icon(
          Icons.add,
        ),
        onPressed: (){},
        backgroundColor: Color(0xffe897af),
      )
    );
  }
}
