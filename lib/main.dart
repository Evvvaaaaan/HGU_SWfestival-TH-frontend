import 'package:flutter/material.dart';
import 'package:hgu_sw_festival/api.dart';
import 'package:hgu_sw_festival/app/page/login_page.dart';
import 'package:hgu_sw_festival/app/page/main_page.dart';

void main() {
  runApp(const MyApp());
  // sendPostRequest();
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(home: LoginPage());
  }
}
