import 'package:flutter/material.dart';
import 'package:hgu_sw_festival/app/page/appBar.dart';
import 'package:hgu_sw_festival/app/page/login_page.dart';
import 'package:hgu_sw_festival/app/page/main_page.dart';
import 'package:hgu_sw_festival/signUpApi.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final TextEditingController emailcontroller = TextEditingController();
  final TextEditingController passwordcontroller = TextEditingController();
  final TextEditingController passwordcheckcontroller = TextEditingController();
  final TextEditingController nicknamecontroller = TextEditingController();
  final TextEditingController locationcontroller = TextEditingController();
  bool obscureText = true;
  bool obscureTexts = true;

  String errorText = '';
  void togglePasswordVisibility() {
    setState(() {
      obscureText = !obscureText; // Toggle the obscureText state
    });
  }

  void togglePasswordVisibilitys() {
    setState(() {
      obscureTexts = !obscureTexts; // Toggle the obscureText state
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Container(
          width: 393,
          height: 852,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/singUpPageBackground.png'),
            ),
          ),
          // padding: const EdgeInsets.only(right: 130, left: 20),
          child: Column(
            children: [
              const SizedBox(
                height: 58,
              ),
              Row(
                children: [
                  IconButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const LoginPage(),
                        ),
                      );
                    },
                    icon: const Icon(Icons.arrow_back_ios_new_rounded),
                  ),
                  const SizedBox(
                    width: 5,
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
                ],
              ),
              const SizedBox(
                height: 80,
              ),
              const Padding(
                padding: EdgeInsets.only(right: 300),
                child: Text(
                  '이메일',
                  style: TextStyle(
                    color: Color.fromARGB(234, 165, 96, 31),
                    decoration: TextDecoration.none,
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              SizedBox(
                width: 343,
                height: 57,
                child: TextFormField(
                  controller: emailcontroller,
                  decoration: const InputDecoration(
                    hintText: '이메일',
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Color.fromARGB(226, 246, 202, 149),
                      ),
                    ),
                    // fillColor: const Color.fromARGB(255, 254, 254, 254),
                    // filled: true,
                    // border: OutlineInputBorder(
                    //   borderRadius: BorderRadius.circular(20.0),
                    //   borderSide: const BorderSide(
                    //     color: Color.fromARGB(255, 183, 255, 40),
                    //     width: 3,
                    //   ),
                    // ),
                  ),
                  obscureText: false,
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(right: 280),
                child: Text(
                  '비밀번호',
                  style: TextStyle(
                    color: Color.fromARGB(234, 165, 96, 31),
                    decoration: TextDecoration.none,
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              const SizedBox(
                width: 7,
              ),
              SizedBox(
                width: 343,
                height: 57,
                child: TextFormField(
                  controller: passwordcontroller,
                  decoration: InputDecoration(
                    hintText: '비밀번호',
                    focusedBorder: const UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Color.fromARGB(226, 246, 202, 149),
                      ),
                    ),
                    suffixIcon: IconButton(
                      onPressed: togglePasswordVisibilitys,
                      icon: Icon(
                        obscureTexts ? Icons.visibility : Icons.visibility_off,
                        color: Colors.grey,
                        size: 20,
                      ),
                    ),
                  ),
                  obscureText: obscureTexts,
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              const Padding(
                padding: EdgeInsets.only(right: 240),
                child: Text(
                  '비밀번호 확인',
                  style: TextStyle(
                    color: Color.fromARGB(234, 165, 96, 31),
                    decoration: TextDecoration.none,
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              const SizedBox(
                width: 7,
              ),
              SizedBox(
                width: 343,
                height: 57,
                child: TextFormField(
                  controller: passwordcheckcontroller,
                  obscureText: obscureText,
                  decoration: InputDecoration(
                    focusedBorder: const UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Color.fromARGB(226, 246, 202, 149),
                      ),
                    ),
                    hintText: '비밀번호 확인',
                    suffixIcon: IconButton(
                      onPressed: togglePasswordVisibility,
                      icon: Icon(
                        obscureText ? Icons.visibility : Icons.visibility_off,
                        color: Colors.grey,
                        size: 20,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              const Padding(
                padding: EdgeInsets.only(right: 290),
                child: Text(
                  '닉네임',
                  style: TextStyle(
                    color: Color.fromARGB(234, 165, 96, 31),
                    decoration: TextDecoration.none,
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              SizedBox(
                width: 343,
                height: 57,
                child: TextFormField(
                  controller: nicknamecontroller,
                  decoration: const InputDecoration(
                    hintText: '닉네임',
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Color.fromARGB(226, 246, 202, 149),
                      ),
                    ),
                  ),
                  obscureText: false,
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              const Padding(
                padding: EdgeInsets.only(right: 280),
                child: Text(
                  '위치정보',
                  style: TextStyle(
                    color: Color.fromARGB(234, 165, 96, 31),
                    decoration: TextDecoration.none,
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              const SizedBox(
                width: 7,
              ),
              SizedBox(
                width: 343,
                height: 57,
                child: TextFormField(
                  controller: locationcontroller,
                  decoration: const InputDecoration(
                    hintText: '위치정보.',
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Color.fromARGB(226, 246, 202, 149),
                      ),
                    ),
                  ),
                  obscureText: false,
                ),
              ),
              const SizedBox(
                height: 243 - 120,
              ),
              SizedBox(
                width: 343,
                height: 41,
                child: Padding(
                  padding: const EdgeInsets.only(right: 1.0),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),

                    onPressed: () {
                      signUp(emailcontroller.text, passwordcontroller.text,
                          nicknamecontroller.text);
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const LoginPage(),
                        ),
                      );
                    },
                    child: const Text(
                      '회원가입 완료',
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w500,
                          fontSize: 18),
                    ), // 버튼 텍스트 변경 가능
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
