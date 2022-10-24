import 'package:flutter/material.dart';
import 'package:colorful_safe_area/colorful_safe_area.dart';
import 'package:get/get.dart';

class CreateDrawer extends StatelessWidget {
  final double drawerWidth;

  const CreateDrawer({super.key,required this.drawerWidth});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: drawerWidth,
        child: ColorfulSafeArea(
          color: const Color(0xffe897af),
          child: Drawer(
            backgroundColor: const Color(0xffffffff),
            child: ListView(
              children: [
                Container(
                  color: const Color(0xffe897af),
                  padding: const EdgeInsets.fromLTRB(0, 8, 0, 0),
                  margin: const EdgeInsets.fromLTRB(0, 0, 0, 8),
                  child: const ListTile(
                    title: Text(
                      "Recently Visited",
                      style: TextStyle(
                        fontSize: 18,
                        color: Color(0xffffffff),
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
                Column(
                  children: [
                    CreateTag(tagname: "tag1",deletableTag: true,),
                    CreateTag(tagname: "tag2 psls",deletableTag: true,),
                    CreateTag(tagname: "ooooooooooooooooooooooooooooooo",deletableTag: true,),
                  ],
                ),
                Container(
                  color: const Color(0xffe897af),
                  padding: const EdgeInsets.fromLTRB(0, 8, 0, 0),
                  margin: const EdgeInsets.fromLTRB(0, 8, 0, 8),
                  child: const ListTile(
                    title: Text(
                      "Your Followed Tag",
                      style: TextStyle(
                        fontSize: 18,
                        color: Color(0xffffffff),
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
                Column(
                  children: [
                    CreateTag(tagname: "followed tag1"),
                    CreateTag(tagname: "passakorn limsaeng passakorn limsaeng"),
                    CreateTag(tagname: "possakarn lumsum possakarn lumsum"),
                    CreateTag(tagname: "fol tag2",),
                    CreateTag(tagname: "fol tag2",),
                    CreateTag(tagname: "fol tag2",),
                    CreateTag(tagname: "fol tag2",),
                    CreateTag(tagname: "fol tag2",),
                    CreateTag(tagname: "fol tag2",),
                    CreateTag(tagname: "fol tag2",),
                    CreateTag(tagname: "fol tag2",),
                    CreateTag(tagname: "fol tag2",),
                    CreateTag(tagname: "fol tag2",),
                  ],
                )
                ,
              ]
              ,
            )
            ,
          ),
        )
    );
  }
}

class CreateTag extends StatelessWidget {
  final String tagname;
  final iconSize = 20.0;
  final double tagHeight = 30.0;
  final double frontMargin = 45;
  final bool deletableTag;
  CreateTag({super.key, required this.tagname, this.deletableTag = false});

  @override
  Widget build(BuildContext context) {
    final double tagWidth = context.width * 0.75 - iconSize - frontMargin - 30;
    return Row(
      //mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        (deletableTag) ?
        IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.delete,
              size: iconSize,
            )
        ) : SizedBox(
          height: iconSize,
          width: 45,
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(0, 8, 0, 8),
          child: SizedBox(
            height: tagHeight,
            width: tagWidth,
            child: TextButton(
                onPressed: () {},
                style: ButtonStyle(
                  alignment: Alignment.centerLeft, // <-- had to set alignment
                  padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                    const EdgeInsets.symmetric(horizontal: 20),
                  ),
                  //maximumSize: MaterialStateProperty.all<Size>(Size(200, tagHeight))

                ),
                child: Text(
                  tagname,
                  style: const TextStyle(
                    fontSize: 12,
                    color: Color(0xff000000),
                    fontWeight: FontWeight.w600,
                  ),
                  maxLines: 1,
                  textAlign: TextAlign.left,
                ),
              ),
            ),
          ),


      ],
    );
  }
}
