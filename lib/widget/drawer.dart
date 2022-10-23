import 'package:flutter/material.dart';
import 'package:colorful_safe_area/colorful_safe_area.dart';

class CreateDrawer extends StatelessWidget {
  final double drawerWidth;

  CreateDrawer({super.key,required this.drawerWidth});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: drawerWidth,
        child: ColorfulSafeArea(
          color: Color(0xffe897af),
          child: Drawer(
            backgroundColor: Color(0xffffffff),
            child: ListView(
              children: [
                Container(
                  color: Color(0xffe897af),
                  padding: EdgeInsets.fromLTRB(0, 8, 0, 0),
                  margin: EdgeInsets.fromLTRB(0, 0, 0, 8),
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
                    CreateTag(tagname: "tag1",drawerWidth: drawerWidth,deletableTag: true,),
                    CreateTag(tagname: "tag2 psls",drawerWidth: drawerWidth,deletableTag: true,),
                    CreateTag(tagname: "ooooooooooooooooooooooooooooooo",drawerWidth: drawerWidth,deletableTag: true,),
                  ],
                ),
                Container(
                  color: Color(0xffe897af),
                  padding: EdgeInsets.fromLTRB(0, 8, 0, 0),
                  margin: EdgeInsets.fromLTRB(0, 8, 0, 8),
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
                    CreateTag(tagname: "followed tag1",drawerWidth: drawerWidth,),
                    CreateTag(tagname: "fol tag2",drawerWidth: drawerWidth,),
                    CreateTag(tagname: "fol tag2",drawerWidth: drawerWidth,),
                    CreateTag(tagname: "fol tag2",drawerWidth: drawerWidth,),
                    CreateTag(tagname: "fol tag2",drawerWidth: drawerWidth,),
                    CreateTag(tagname: "fol tag2",drawerWidth: drawerWidth,),
                    CreateTag(tagname: "fol tag2",drawerWidth: drawerWidth,),
                    CreateTag(tagname: "fol tag2",drawerWidth: drawerWidth,),
                    CreateTag(tagname: "passakorn limsaeng passakorn limsaeng",drawerWidth: drawerWidth,),
                    CreateTag(tagname: "possakarn lumsum possakarn lumsum",drawerWidth: drawerWidth,),
                    CreateTag(tagname: "fol tag2",drawerWidth: drawerWidth,),
                    CreateTag(tagname: "fol tag2",drawerWidth: drawerWidth,),
                    CreateTag(tagname: "fol tag2",drawerWidth: drawerWidth,),
                    CreateTag(tagname: "fol tag2",drawerWidth: drawerWidth,),
                    CreateTag(tagname: "fol tag2",drawerWidth: drawerWidth,),
                    CreateTag(tagname: "fol tag2",drawerWidth: drawerWidth,),
                    CreateTag(tagname: "fol tag2",drawerWidth: drawerWidth,),

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
  String tagname;
  var iconSize = 20.0;
  final double tagHeight = 30.0;
  final double drawerWidth;
  final double frontMargin = 45;
  var deletableTag;
  CreateTag({super.key, required this.tagname, required this.drawerWidth, this.deletableTag = false});

  @override
  Widget build(BuildContext context) {
    final double tagWidth = drawerWidth - iconSize - frontMargin - 30;
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
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(18),
                color: const Color(0xffffffff),
              ),
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
        ),

      ],
    );
  }
}
