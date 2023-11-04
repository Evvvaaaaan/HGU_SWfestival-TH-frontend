// import 'dart:js';

import 'package:flutter/material.dart';
import 'package:hgu_sw_festival/api.dart';
import 'package:hgu_sw_festival/app/page/afterTrade.dart';
import 'package:hgu_sw_festival/app/page/afterTradeWrite.dart';
import 'package:hgu_sw_festival/app/page/chat.dart';
import 'package:hgu_sw_festival/app/page/chatRoom.dart';
import 'package:hgu_sw_festival/app/page/loading.dart';
import 'package:hgu_sw_festival/app/page/login_page.dart';
import 'package:hgu_sw_festival/app/page/main_page.dart';
import 'package:hgu_sw_festival/app/page/map.dart';
import 'package:hgu_sw_festival/app/page/myPage.dart';
import 'package:hgu_sw_festival/app/page/posted.dart';
import 'package:hgu_sw_festival/app/page/postinfound.dart';
import 'package:hgu_sw_festival/app/page/posting.dart';
import 'package:hgu_sw_festival/app/page/preLogin.dart';
import 'package:hgu_sw_festival/app/page/profileEdit.dart';
import 'package:hgu_sw_festival/app/page/search.dart';
import 'package:hgu_sw_festival/app/page/signUpPage.dart';
import 'package:hgu_sw_festival/app/page/someonePage.dart';
import 'package:hgu_sw_festival/app/page/start.dart';

void main() {
  runApp(
    MaterialApp(
      initialRoute: '/',
      home: const StartPage(),
      routes: <String, WidgetBuilder>{
        '/someonepage': (context) => const SomeonePage(),
        '/afterwritetrade': (context) => const AfterTradeWritePage(),
        '/map': (context) => const MapScreen(),
        'aftertfade': (context) => const AfterTradePage(),
        '/loading': (context) => const LodingPage(),
        '/prelogin': (context) => const PreLogin(),
        '/start': (context) => const StartPage(),
        '/mainpage': (context) => const MainPage(),
        '/login': (context) => const LoginPage(),
        '/chat': (context) => const ChatPage(),
        '/posting': (context) => const Posting(),
        '/posting2': (context) => const Posting2(),
        '/posted': (context) => const PostedPage(),
        '/signup': (context) => const SignUpPage(),
        '/search': (context) => const SearchPage(),
        '/mypage': (context) => const MyPage(),
        '/editprofile': (context) => const EditProfile(),
      },
      onUnknownRoute: (settings) {
        // 알 수 없는 경로에 대한 처리 로직을 여기에 구현합니다.
        // 이 함수는 경로를 찾을 수 없을 때 호출됩니다.
        return MaterialPageRoute(
          builder: (context) {
            return Scaffold(
              resizeToAvoidBottomInset: false,
              appBar: AppBar(
                title: const Text('Unknown Route'),
              ),
              body: const Center(
                child: Text('Requested page was not found.'),
              ),
            );
          },
        );
      },
    ),
  );
  // sendPostRequest();
}
