import 'package:flutter/material.dart';

class Topbar extends StatelessWidget {
  final String tag;
  const Topbar({super.key, required this.tag});
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xffff82dc),
      padding: const EdgeInsets.fromLTRB(5.0, 20.0, 12.0, 8.0),
      child: Row(
        children: [
          const Icon(
            Icons.menu,
            size: 48.0,
          ),
          const SizedBox(
            width: 9,
          ),
          Row(
            children: [
              Expanded(
                flex: 2,
                child: Container(
                  decoration: BoxDecoration(
                    color: const Color(0xffFFFFFF),
                    borderRadius: BorderRadius.circular(18),
                  ),
                  child: Text(
                    tag,
                  ),
                ),
              ),
              const Expanded(
                flex: 2,
                child: SizedBox(

                ),
              ),
              Expanded(
                flex: 3,
                child: Container(
                  decoration: const BoxDecoration(
                    color: Color(0xffFFFFFF),
                  ),
                  alignment: Alignment.centerRight,
                  padding: const EdgeInsets.fromLTRB(0.0, 0.0, 8.0, 0.0),
                  child: const Icon(
                    Icons.search,
                    size: 15,
                  ),
                ),
              ),
            ],
          ),
          const CircleAvatar(
            radius: 39,
            backgroundImage: AssetImage('asset/sample_user.png'),
          )
        ],
      ),
    );
  }
}

