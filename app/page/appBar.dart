import 'package:flutter/material.dart';
import 'package:hgu_sw_festival/app/page/main_page.dart';

Widget appBar(BuildContext context) {
  return Row(
    children: [
      const SizedBox(
        width: 50 / 3,
      ),
      IconButton(
        onPressed: () {
          // 이것으로 수정 가능할 수도 있다
          // Navigator.push(
          //   context,
          //   MaterialPageRoute(
          //     builder: (context) => const MainPage(),
          //   ),
          // );
          Navigator.pop(context);
        },
        icon: const Icon(Icons.arrow_back_ios_new_rounded),
      ),
      const SizedBox(
        width: 2,
      ),
      Container(
        width: 128,
        height: 35,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/treater.png'),
            fit: BoxFit.cover,
          ),
        ),
      ),
      const SizedBox(
        width: 110,
      ),
      const SizedBox(
        width: 20,
        height: 20,
        child: Icon(
          Icons.search_outlined,
        ),
      ),
      const SizedBox(
        width: 13,
      ),
      const SizedBox(
        width: 20,
        height: 20,
        child: Icon(
          Icons.person,
        ),
      ),
    ],
  );
}
