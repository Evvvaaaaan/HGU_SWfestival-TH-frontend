import 'package:flutter/material.dart';
import 'dart:async';

import 'package:hgu_sw_festival/app/page/login_page.dart';
import 'package:hgu_sw_festival/app/page/signUpPage.dart';

class PreLogin extends StatefulWidget {
  const PreLogin({Key? key}) : super(key: key);

  @override
  _PreLoginState createState() => _PreLoginState();
}

class _PreLoginState extends State<PreLogin> {
  bool showContainer = false;

  @override
  void initState() {
    super.initState();
    // Set a timer to display the container after 5 seconds
    Timer(const Duration(seconds: 1), () {
      setState(() {
        showContainer = true;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
          width: 393,
          height: 852,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/startBackground.png'),
              fit: BoxFit.cover,
            ),
          ),
          child: Column(
            children: [
              const SizedBox(
                height: 483,
              ),
              AnimatedOpacity(
                opacity: showContainer ? 1.0 : 0.0,
                duration: const Duration(
                    seconds: 1), // Changed the duration to 2 seconds
                curve: Curves.fastEaseInToSlowEaseOut,
                child: Container(
                  width: 393,
                  height: 367,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(38),
                      topRight: Radius.circular(38),
                    ),
                  ),
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 40,
                      ),
                      Container(
                        width: 244,
                        height: 66,
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage('assets/images/treater.png'),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 34,
                      ),
                      SizedBox(
                        width: 343,
                        height: 52,
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const LoginPage(),
                              ),
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(
                                0xFFD19A47), // Set the background color
                          ),
                          child: const Text(
                            '로그인',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      SizedBox(
                        width: 343,
                        height: 52,
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const SignUpPage(),
                              ),
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color.fromARGB(
                                255, 255, 214, 153), // Set the background color
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(12.0),
                            child: const Text(
                              '회원가입',
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
