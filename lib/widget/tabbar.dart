import 'package:flutter/material.dart';

class CustomTopBar extends StatelessWidget implements PreferredSizeWidget {
  final String tag;
  final double height;

  CustomTopBar({
    required this.tag,
    this.height = kToolbarHeight,
  });

  @override
  Size get preferredSize => Size.fromHeight(height);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Color(0xffffffff),
      title: Container(
        decoration: BoxDecoration(
            color: const Color(0xffffffff),
            borderRadius: BorderRadius.circular(18),
            border: Border.all(width: 0, color: Color(0))),
        child: Padding(
          padding: EdgeInsets.fromLTRB(15, 10, 15, 10),
          child: Text(
            tag,
            style: const TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w600,
              color: Color(0xff000000),
            ),
          ),
        ),
      ),
      leading: IconButton(
        padding: EdgeInsets.all(4),
        icon: Icon(
          Icons.menu,
          color: Color(0xff000000),
        ),
        iconSize: 20,
        onPressed: () => Scaffold.of(context).openDrawer(),
      ),
      actions: [
        IconButton(
          padding: EdgeInsets.all(4),
          onPressed: () {},
          icon: Icon(
            Icons.search,
            color: Color(0xff000000),
          ),
          iconSize: 20,

        ),
        IconButton(
          padding: EdgeInsets.all(4),
          onPressed: () {},
          icon: Icon(
            Icons.account_circle,
            color: Color(0xff000000),
          ),
          iconSize: 20,
        ),
      ],
    );
  }
}

class CustomBotBar extends StatelessWidget implements PreferredSizeWidget {
  final double height;

  CustomBotBar({
    this.height = kToolbarHeight,
  });

  @override
  Size get preferredSize => Size.fromHeight(height);

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
        shape: CircularNotchedRectangle(),
        color: Color(0xffffffff),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.home,
                  size: 20,
                )),
            SizedBox(
              width: 0,
            ),
            IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.explore,
                  size: 20,
                ))
          ],
        ));
  }
}
