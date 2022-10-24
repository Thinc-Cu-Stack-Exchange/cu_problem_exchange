import 'package:cu_problem_exchange/route_names.dart';
import 'package:flutter/material.dart';
import 'package:colorful_safe_area/colorful_safe_area.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class Account extends GetView<AccountController> {
  var userName = "PassakornLimsaengLimsaeng";
  var userEmail = "psls@hatyaiwit.ac.th";
  var userKarma = 696;
  var textboldStyle = const TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w600,
    color: Color(0xff000000),
  );
  var textStyle = const TextStyle(
    fontSize: 16,
    color: Color(0xff000000),
  );
  Account({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffE7E7E7),
      body: ColorfulSafeArea(
        color: const Color(0xffe897af),
        child: Column(
          children: [
            Container( // Header
              color: const Color(0xffe897af),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Row(
                  children: [
                    IconButton(
                        onPressed: controller.closePressed,
                        icon: const Icon(
                          Icons.close,
                          color: Color(0xffffffff),
                        )
                    ),
                    const Text(
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
            const Align( // Avatar
              alignment: Alignment.center,
              child: Padding(
                padding: EdgeInsets.all(35.0),
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
                  color: const Color(0xffffffff),
                ),
                child: SizedBox(
                  width: context.width * 0.85,
                  child: Padding(
                    padding: const EdgeInsets.all(10),
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
                                    padding: const EdgeInsets.fromLTRB(10, 10 , 0, 10),
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
                                    padding: const EdgeInsets.fromLTRB(10, 10 , 0, 10),
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
                                    padding: const EdgeInsets.fromLTRB(10, 10 , 0, 10),
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
                                    padding: const EdgeInsets.fromLTRB(10, 10 , 0, 10),
                                    child: Text(
                                      ":  $userName",
                                      style: textStyle,
                                      maxLines: 1,
                                    ),
                                  ),
                                  Container(
                                    alignment: Alignment.topLeft,
                                    padding: const EdgeInsets.fromLTRB(10, 10 , 0, 10),
                                    child: Text(
                                      ":  $userEmail",
                                      style: textStyle,
                                      maxLines: 1,
                                    ),
                                  ),
                                  Container(
                                    alignment: Alignment.topLeft,
                                    padding: const EdgeInsets.fromLTRB(10, 10 , 0, 10),
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
                          padding: const EdgeInsets.symmetric(vertical: 30),
                          child: Text(
                            userKarma.toString(),
                            style: const TextStyle(
                              fontSize: 55,
                              fontWeight: FontWeight.w900,
                              color: Color(0xff000000),
                            ),
                          ),
                        ),
                        Align(
                          alignment: Alignment.centerRight,
                          child: ElevatedButton(
                              onPressed: () {},
                              child: const Text(
                                "Log Out",
                                style: TextStyle(
                                  color: Color(0xffffffff),
                                  fontSize: 16,
                                ),
                              )
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

  void closePressed(){
    Get.offNamed(RouteNames.home);
  }

}
