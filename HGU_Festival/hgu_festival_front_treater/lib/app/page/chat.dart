import 'package:flutter/material.dart';
import 'package:hgu_sw_festival/app/page/appBar.dart';

Widget chatRoom() {
  return ElevatedButton(
    style: ElevatedButton.styleFrom(
      backgroundColor: const Color.fromARGB(255, 248, 255, 234),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(0),
      ),
    ),
    onPressed: () {
      print('hello world');
    },
    child: SizedBox(
      height: 130,
      width: 393,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          const SizedBox(
            height: 20,
          ),
          Row(
            children: [
              Container(
                width: 40,
                height: 40,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/images/profile.png'),
                  ),
                ),
              ),
              const SizedBox(
                width: 11,
              ),
              const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'User Name',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: Color.fromARGB(255, 67, 73, 62),
                    ),
                  ),
                  SizedBox(
                    height: 3,
                  ),
                  Text(
                    '새 메시지 3개',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: Color.fromARGB(255, 67, 73, 62),
                    ),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Container(
            height: 1, // 선의 높이 (두께)
            width: 292, // 선의 너비
            color: Colors.grey, // 선의 색깔
          )
        ],
      ),
    ),
  );
}

class ChatPage extends StatelessWidget {
  const ChatPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Column(
          children: [
            Container(
              width: 487,
              height: 324 - 72 - 10,
              decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/images/chatBackground.png'),
                    fit: BoxFit.none),
              ),
              child: Column(
                children: [
                  const SizedBox(
                    height: 59,
                  ),
                  appBar(context),
                ],
              ),
            ),
            Container(
              width: 393,
              height: 600,
              color: const Color.fromARGB(255, 248, 255, 234),
              child: ListView(
                children: [
                  chatRoom(),
                  chatRoom(),
                  chatRoom(),
                  chatRoom(),
                  chatRoom(),
                  chatRoom(),
                  chatRoom(),
                  chatRoom(),
                  chatRoom(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
