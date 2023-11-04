import 'package:flutter/material.dart';
import 'package:hgu_sw_festival/app/page/appBar.dart';

class AfterTradeWritePage extends StatefulWidget {
  const AfterTradeWritePage({super.key});

  @override
  State<AfterTradeWritePage> createState() => _AfterTradeWritePageState();
}

class _AfterTradeWritePageState extends State<AfterTradeWritePage> {
  bool isYellow1 = false;
  bool isYellow2 = false;
  bool isYellow3 = false;
  bool isYellow4 = false;
  bool isYellow5 = false;
  final TextEditingController _controller = TextEditingController();
  final int maxCharacters = 50;
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
              image: AssetImage('assets/images/postingBackground.png'),
            ),
          ),
          child: Column(
            children: [
              const SizedBox(
                height: 55,
              ),
              appBar(context),
              const SizedBox(
                height: 23,
              ),
              Row(
                children: [
                  const SizedBox(
                    width: 36,
                  ),
                  Container(
                    width: 110,
                    height: 110,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/images/profile.png'),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 21,
                  ),
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '이삼순',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w600),
                      ),
                      Text(
                        'Point: 999',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(
                height: 27,
              ),
              Container(
                width: 343,
                height: 482,
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 248, 255, 234),
                  borderRadius: BorderRadius.circular(15.0),
                ),
                child: Column(
                  children: [
                    const SizedBox(height: 17),
                    const Text(
                      '리뷰 쓰기',
                      style: TextStyle(fontSize: 20),
                    ),
                    const SizedBox(
                      height: 47,
                    ),
                    const Text(
                      '후기를 작성해주세요!',
                      style: TextStyle(fontSize: 17),
                    ),
                    const SizedBox(
                      height: 17,
                    ),
                    const Text('최고에요'),
                    Row(
                      children: [
                        const SizedBox(
                          width: 47,
                        ),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              isYellow1 = !isYellow1;
                            });
                          },
                          child: Icon(
                            Icons.star_rate_rounded,
                            size: 50,
                            color: isYellow1
                                ? const Color.fromARGB(255, 255, 199, 67)
                                : Colors.grey,
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              isYellow2 = !isYellow2;
                            });
                          },
                          child: Icon(
                            Icons.star_rate_rounded,
                            size: 50,
                            color: isYellow2
                                ? const Color.fromARGB(255, 255, 199, 67)
                                : Colors.grey,
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              isYellow3 = !isYellow3;
                            });
                          },
                          child: Icon(
                            Icons.star_rate_rounded,
                            size: 50,
                            color: isYellow3
                                ? const Color.fromARGB(255, 255, 199, 67)
                                : Colors.grey,
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              isYellow4 = !isYellow4;
                            });
                          },
                          child: Icon(
                            Icons.star_rate_rounded,
                            size: 50,
                            color: isYellow4
                                ? const Color.fromARGB(255, 255, 199, 67)
                                : Colors.grey,
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              isYellow5 = !isYellow5;
                            });
                          },
                          child: Icon(
                            Icons.star_rate_rounded,
                            size: 50,
                            color: isYellow5
                                ? const Color.fromARGB(255, 255, 199, 67)
                                : Colors.grey,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Container(
                      width: 309,
                      height: 0.5,
                      color: Colors.grey,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Container(
                      padding: const EdgeInsets.only(left: 12),
                      width: 309,
                      height: 190,
                      color: const Color.fromARGB(255, 237, 250, 211),
                      child: SizedBox(
                        width: 309,
                        height: 190,
                        child: TextFormField(
                          controller: _controller,
                          maxLines: null, // null로 설정하여 자동으로 늘어나도록 설정
                          maxLength: 201,
                          style: const TextStyle(
                              color: Colors.black), // 원하는 스타일을 지정해주세요
                          // maxLength: 100,
                          decoration: const InputDecoration(
                            hintText: '',
                            border: InputBorder.none,
                          ),
                          onChanged: (value) {
                            if (value.length >= maxCharacters &&
                                value.endsWith(' ')) {
                              // 특정 글자 수에 도달하고 마지막 글자가 공백인 경우 줄바꿈
                              _controller.text += '\n';
                            }
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 36,
              ),
              Container(
                width: 343,
                height: 41,
                decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 251, 255, 243),
                    borderRadius: BorderRadius.circular(13)),
                child: ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(
                      const Color.fromARGB(255, 251, 255, 243),
                    ),
                  ),
                  onPressed: () {
                    print('hello');
                  },
                  child: const Text(
                    '등록하기',
                    style: TextStyle(
                      fontSize: 21,
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                    ),
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
