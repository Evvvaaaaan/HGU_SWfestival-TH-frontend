import 'package:flutter/material.dart';
import 'package:hgu_sw_festival/app/page/main_page.dart';
import 'package:hgu_sw_festival/app/page/posted.dart';
import 'package:hgu_sw_festival/resentPostlist.dart';

class LodingPage extends StatelessWidget {
  const LodingPage({super.key});

  @override
  Widget build(BuildContext context) {
    resentPostlist();
    return MaterialApp(
      home: Scaffold(
        body: Column(
          children: [
            const SizedBox(
              height: 400,
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 251, 255, 243),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(13.0),
                  )),
              onPressed: () {
                resentPostlist();
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const MainPage(),
                  ),
                );
              },
              child: Container(
                width: 317,
                height: 41,
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: const Text(
                  'Waiting',
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.black),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
