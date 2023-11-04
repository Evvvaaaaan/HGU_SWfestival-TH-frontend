import 'package:flutter/material.dart';

class EditProfile extends StatelessWidget {
  const EditProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
          width: 392,
          height: 852,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/profileEditBackground.png'),
            ),
          ),
          child: Column(
            children: [
              Positioned(
                top: 300,
                left: 100,
                child: IconButton(
                    onPressed: () {
                      print('object');
                    },
                    icon: const Icon(Icons.photo_size_select_actual_outlined)),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: 110,
                  ),
                  Container(
                    height: 110,
                    width: 110,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/images/profile.png'),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                    width: 20,
                  ),
                ],
              ),
              const Row(
                children: [
                  Text('이메일'),
                ],
              ),
              const Row(
                children: [
                  Text('비밀번호'),
                ],
              ),
              const Row(
                children: [
                  Text('닉네임'),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
