import 'package:flutter/material.dart';
import 'package:cu_problem_exchange/widget/tabbar.dart';
import 'package:colorful_safe_area/colorful_safe_area.dart';

class Account extends StatelessWidget {
  const Account({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ColorfulSafeArea(
        color: Color(0xffe897af),
        child: Column(
          children: [
            Row(
              children: [
                Container(
                  color: Color(0xffe897af),
                  child: Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.close,
                            size: 20,
                          )
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(35.0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: CircleAvatar(
                  backgroundColor: Color(0xffffffff),
                  child: Align(
                    alignment: Alignment.center,
                    child: CircleAvatar(
                      backgroundImage: AssetImage('assets/sample_user.png'),
                      radius: 107,
                    ),
                  ),
                ),
              ),
            ),


          ],
        ),
      ),
    );
  }
}
