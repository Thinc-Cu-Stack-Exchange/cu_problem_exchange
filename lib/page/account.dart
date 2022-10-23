import 'package:flutter/material.dart';
import 'package:colorful_safe_area/colorful_safe_area.dart';
import 'package:get/get.dart';

class Account extends GetView<AccountController> {
  var userName = "PassakornLimsaengLimsaeng";
  var userEmail = "psls@hatyaiwit.ac.th";
  var userKarma = 696;
  var textboldStyle = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w600,
    color: Color(0xff000000),
  );
  var textStyle = TextStyle(
    fontSize: 16,
    color: Color(0xff000000),
  );
  Account({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffE7E7E7),
      body: ColorfulSafeArea(
        color: Color(0xffe897af),
        child: Column(
          children: [
            Container( // Header
              color: Color(0xffe897af),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Row(
                  children: [
                    IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.close,
                          color: Color(0xffffffff),
                        )
                    ),
                    Text(
                      "User Account",
                      style: TextStyle(
                        color: Color(0xffffffff),
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    )
                  ],
                ),
              ),
            ),
            Align( // Avatar
              alignment: Alignment.center,
              child: Padding(
                padding: const EdgeInsets.all(35.0),
                child: CircleAvatar(
                  backgroundColor: Color(0xffffffff),
                  radius: 75,
                  child: Align(
                    alignment: Alignment.center,
                    child: CircleAvatar(
                      backgroundImage: AssetImage('assets/sample_user.png'),
                      radius: 60,
                    ),
                  ),
                ),
              ),
            ),
            Align( // TextBox
              alignment: Alignment.center,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(18),
                  color: Color(0xffffffff),
                ),
                child: SizedBox(
                  width: context.width * 0.85,
                  child: Padding(
                    padding: EdgeInsets.all(10),
                    child: Column(
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Column( // Column of Name , Gamil , Karma
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Align(
                                  alignment: Alignment.topLeft,
                                  child: Container(
                                    padding: EdgeInsets.fromLTRB(10, 10 , 0, 10),
                                    child: Text(
                                      "Name ",
                                      style: textboldStyle,
                                      maxLines: 1,
                                    ),
                                  ),
                                ),
                                Align(
                                  alignment: Alignment.topLeft,
                                  child: Container(
                                    padding: EdgeInsets.fromLTRB(10, 10 , 0, 10),
                                    child: Text(
                                      "Gmail ",
                                      style: textboldStyle,
                                      maxLines: 1,
                                    ),
                                  ),
                                ),
                                Align(
                                  alignment: Alignment.topLeft,
                                  child: Container(
                                    padding: EdgeInsets.fromLTRB(10, 10 , 0, 10),
                                    child: Text(
                                      "Karma ",
                                      style: textboldStyle,
                                      maxLines: 1,
                                    ),
                                  ),
                                ),

                              ],
                            ),
                            SizedBox(
                              width: context.width * 0.55,
                              child: Column( // Column of userInput
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    alignment: Alignment.topLeft,
                                    padding: EdgeInsets.fromLTRB(10, 10 , 0, 10),
                                    child: Text(
                                      ":  $userName",
                                      style: textStyle,
                                      maxLines: 1,
                                    ),
                                  ),
                                  Container(
                                    alignment: Alignment.topLeft,
                                    padding: EdgeInsets.fromLTRB(10, 10 , 0, 10),
                                    child: Text(
                                      ":  $userEmail",
                                      style: textStyle,
                                      maxLines: 1,
                                    ),
                                  ),
                                  Container(
                                    alignment: Alignment.topLeft,
                                    padding: EdgeInsets.fromLTRB(10, 10 , 0, 10),
                                    child: Text(
                                      ":",
                                      style: textStyle,
                                      maxLines: 1,
                                    ),
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(vertical: 30),
                          child: Text(
                            userKarma.toString(),
                            style: TextStyle(
                              fontSize: 55,
                              fontWeight: FontWeight.w900,
                              color: Color(0xff000000),
                            ),
                          ),
                        ),
                        Align(
                          alignment: Alignment.centerRight,
                          child: Container(
                            // decoration: BoxDecoration(
                            //   color: Color(0xffe897af),
                            //   borderRadius: BorderRadius.circular(18),
                            // ),
                            child: ElevatedButton(
                                onPressed: () {},
                                child: Text(
                                  "Log Out",
                                  style: TextStyle(
                                    color: Color(0xffffffff),
                                    fontSize: 16,
                                  ),
                                )
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            )

          ],
        ),
      ),
    );
  }
}

class AccountBindings extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => AccountController());
  }

}

class AccountController extends GetxController{

}
