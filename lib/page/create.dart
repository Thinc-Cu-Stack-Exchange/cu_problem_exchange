import 'package:flutter/material.dart';

class Create extends StatelessWidget {
  const Create({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  icon: const Icon(Icons.close),
                  onPressed: () {},
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(horizontal: 24),
                      shape: const RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.all(Radius.circular(40.0)))),
                  onPressed: () {},
                  child: const Text("Next"),
                )
              ],
            ),
            Expanded(
                child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Column(children: const [
                      TextField(
                        style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Title',
                        ),
                        maxLines: null,
                      ),
                      TextField(
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.normal),
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Content',
                        ),
                        maxLines: null,
                        keyboardType: TextInputType.multiline,
                      )
                    ]))),
            ElevatedButton(
                onPressed: () {},
                child: Padding(
                    padding: const EdgeInsets.all(15),
                    child: Row(
                      children: const [
                        Padding(
                            padding: EdgeInsets.only(right: 20),
                            child: Icon(
                              Icons.add_photo_alternate_outlined,
                              size: 40,
                            )),
                        Text(
                          "Photo",
                          style: TextStyle(
                              fontSize: 22, fontWeight: FontWeight.normal),
                        )
                      ],
                    )))
          ],
        ),
      ),
    );
  }
}
