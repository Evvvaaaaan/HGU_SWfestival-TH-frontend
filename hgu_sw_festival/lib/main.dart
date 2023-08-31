import 'package:flutter/material.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Column(
        children: [
          Icon(Icons.safety_check_rounded),
        ],
      ),
    );
  }
}
