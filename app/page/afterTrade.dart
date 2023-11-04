import 'package:flutter/material.dart';
import 'package:hgu_sw_festival/app/page/afterTradeWrite.dart';
import 'package:hgu_sw_festival/app/page/appBar.dart';

class AfterTradePage extends StatelessWidget {
  const AfterTradePage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
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
                child: const Text(
                  '작성된 후기가 없습니다.',
                  textAlign: TextAlign.center,
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
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const AfterTradeWritePage(),
                      ),
                    );
                  },
                  child: const Text(
                    '후기 작성하기',
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
