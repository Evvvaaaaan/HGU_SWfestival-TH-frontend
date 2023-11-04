import 'package:flutter/material.dart';
import 'package:hgu_sw_festival/api.dart';
import 'package:hgu_sw_festival/app/page/main_page.dart';
import 'package:hgu_sw_festival/app/page/signUpPage.dart';
import 'package:hgu_sw_festival/createAccount.dart';
import 'package:hgu_sw_festival/resentPostlist.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: LoginPageForm(),
    );
  }
}

class LoginPageForm extends StatefulWidget {
  const LoginPageForm({super.key});

  @override
  State<LoginPageForm> createState() => LoginPageFormState();
}

class LoginPageFormState extends State<LoginPageForm> {
  bool _buttonEnabled = true;
  final TextEditingController passwordCheckController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  void _onButtonPressed() {
    if (_buttonEnabled) {
      setState(() {
        _buttonEnabled = false;
      });

      Future.delayed(const Duration(seconds: 5), () {
        setState(() {
          _buttonEnabled = true;
        });
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    resentPostlist();
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Center(
        child: Container(
          width: 393,
          height: 852,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/myPageBackground.png'),
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(
                height: 181,
              ),
              const Image(
                width: 125,
                height: 99,
                image: AssetImage('assets/images/treasure.png'),
              ),
              const SizedBox(
                height: 99,
              ),
              SizedBox(
                width: 343,
                height: 48,
                child: TextFormField(
                  controller: emailController,
                  decoration: const InputDecoration(
                    hintText: '이메일',
                    fillColor: Color(0xFFFAFAFA), // 내부 색상을 #FAFAFA로 변경
                    filled: true,
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 15.0, horizontal: 10.0),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(12.0),
                      ),
                      borderSide: BorderSide(
                        color: Color.fromRGBO(239, 239, 239, 1),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              SizedBox(
                width: 343,
                height: 48,
                child: TextFormField(
                  controller: passwordController,
                  decoration: const InputDecoration(
                    hintText: '비밀번호',
                    fillColor: Color(0xFFFAFAFA), // 내부 색상을 #FAFAFA로 변경
                    filled: true,
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 15.0, horizontal: 10.0),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(12.0),
                      ),
                      borderSide: BorderSide(
                        color: Color(0xFFEFEFEF), // #EFEFEF 색상
                      ),
                    ),
                  ),
                  obscureText: true,
                ),
              ),
              const SizedBox(
                height: 32,
              ),
              SizedBox(
                width: 343,
                height: 52,
                child: ElevatedButton(
                  onPressed: _buttonEnabled
                      ? () async {
                          String email = emailController.text;
                          String password = passwordController.text;
                          bool loginSuccess =
                              await sendPostRequest(email, password);

                          if (loginSuccess == true) {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const MainPage(),
                              ),
                            );
                          }
                          _onButtonPressed();
                        }
                      : null,
                  style: ButtonStyle(
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.circular(12.0), // border radius 변경
                      ),
                    ),
                    backgroundColor: MaterialStateProperty.all<Color>(
                      const Color.fromRGBO(170, 123, 24, 1),
                    ),
                  ),
                  child: const Text(
                    '로그인',
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.w700),
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
                  style: ButtonStyle(
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.circular(12.0), // border radius 변경
                      ),
                    ),
                    backgroundColor: MaterialStateProperty.all<Color>(
                      const Color.fromRGBO(255, 214, 153, 1), // 배경 색상 변경
                    ),
                  ),
                  child: const Text(
                    '회원가입',
                    style: TextStyle(
                        color: Color.fromRGBO(170, 123, 24, 1),
                        fontWeight: FontWeight.w700),
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
