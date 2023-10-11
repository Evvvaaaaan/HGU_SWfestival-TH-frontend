import 'package:flutter/material.dart';
import 'package:logger/logger.dart';

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
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
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
              image: AssetImage('assets/images/treasure-2 1.png'),
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
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(12.0),
                    ),
                    borderSide: BorderSide(
                      color: Color(0xFFEFEFEF), // #EFEFEF 색상
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
                onPressed: () {
                  // 여기에서 로그인 로직을 구현합니다.
                  String email = emailController.text;
                  String password = passwordController.text;
                },
                style: ButtonStyle(
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.circular(12.0), // border radius 변경
                    ),
                  ),
                  backgroundColor: MaterialStateProperty.all<Color>(
                    const Color(0x00d19a47),
                  ),
                ),
                child: const Text('로그인'),
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
                  // 여기에서 로그인 로직을 구현합니다.
                  String email = emailController.text;
                  String password = passwordController.text;
                },
                style: ButtonStyle(
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.circular(12.0), // border radius 변경
                    ),
                  ),
                  backgroundColor: MaterialStateProperty.all<Color>(
                    const Color(0x00d19a47), // 배경 색상 변경
                  ),
                ),
                child: const Text('회원가입'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
