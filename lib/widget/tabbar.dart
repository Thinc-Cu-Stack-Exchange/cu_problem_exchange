import 'package:cu_problem_exchange/route_names.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomTopBar extends StatelessWidget implements PreferredSizeWidget {
  final String tag;
  final double height;
  final bool isHome;
  const CustomTopBar({
    super.key,
    required this.tag,
    this.height = kToolbarHeight,
    this.isHome = false,
  });

  @override
  Size get preferredSize => Size.fromHeight(height);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: const Color(0xffe897af),
      title: Container(
        decoration: BoxDecoration(
            //color: const Color(0xffffffff),
            borderRadius: BorderRadius.circular(18),
            border: Border.all(width: 0, color: const Color(0x00000000))),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(0, 10, 15, 10),
          child: Text(
            tag,
            style: const TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w600,
              color: Color(0xffffffff),
            ),
          ),
        ),
      ),
      leading: IconButton(
        padding: const EdgeInsets.all(4),
        icon: const Icon(
          Icons.menu,
          color: Color(0xffffffff),
        ),
        iconSize: 20,
        onPressed: () => Scaffold.of(context).openDrawer(),
      ),
      actions: [
        // Favorite
        (!isHome) ? IconButton(
          padding: const EdgeInsets.all(4),
          onPressed: () {
            Get.toNamed(RouteNames.home);
          } ,
          icon: const Icon(
            Icons.home,
            color: Color(0xffffffff),
          ),
          iconSize: 20,
        ) : Container(),
        // Home
        (!isHome) ? IconButton(
          padding: const EdgeInsets.all(4),
          onPressed: () {

          } ,
          icon: const Icon(
            Icons.star_border_outlined,
            color: Color(0xffffffff),
          ),
          iconSize: 20,
        ) : Container(),
        IconButton(
          padding: const EdgeInsets.all(4),
          onPressed: () {
            Get.toNamed(RouteNames.find);
          },
          icon: const Icon(
            Icons.search,
            color: Color(0xffffffff),
          ),
          iconSize: 20,
        ),
        IconButton(
          padding: const EdgeInsets.all(4),
          onPressed: () {
            Get.toNamed(RouteNames.account);
          },
          icon: const Icon(
            Icons.account_circle,
            color: Color(0xffffffff),
          ),
          iconSize: 20,
        ),
      ],
    );
  }
}

class CustomBotBar extends StatelessWidget implements PreferredSizeWidget {
  final double height;

  const CustomBotBar({
    super.key,
    this.height = kToolbarHeight,
  });

  @override
  Size get preferredSize => Size.fromHeight(height);

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
        shape: const CircularNotchedRectangle(),
        color: const Color(0xffe897af),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            IconButton(
                onPressed: () {
                  Get.toNamed(RouteNames.home);
                },
                icon: const Icon(
                  Icons.home,
                  size: 20,
                  color: Color(0xffffffff),
                )),
            const SizedBox(
              width: 0,
            ),
            IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.explore,
                  size: 20,
                  color: Color(0xffffffff),
                ))
          ],
        ));
  }
}
