// import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

Widget mainpageFrame() {
  return SizedBox(
    width: 164,
    height: 290,
    child: Column(
      children: [
        Container(
          width: 164,
          height: 101,
          color: Colors.black,
          child: const Column(
            children: [
              Text('분실물 이름'),
              Text('분실물 위치'),
            ],
          ),
        ),
        Container(
          width: 164,
          height: 189,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/mainpage_background.png'),
            ),
          ),
        ),
      ],
    ),
  );
}

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
          height: 900,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/mainpage_background.png'),
              fit: BoxFit.none,
              alignment: Alignment.topCenter,
            ),
          ),
          child: Stack(
            children: [
              Container(
                alignment: Alignment.center,
                child: const Column(
                  children: [
                    SizedBox(
                      height: 65,
                    ),
                    Positioned(
                      top: 50,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Icon(
                            Icons.search_outlined,
                            color: Colors.black,
                          ),
                          SizedBox(
                            width: 30,
                          ),
                          Icon(Icons.my_library_add_outlined),
                          SizedBox(width: 30),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 50,
                    ),
                    Text(
                      "Treater에서\n보물을 찾으세요!",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 24,
                          color: Colors.white,
                          fontWeight: FontWeight.w600),
                    ),
                    SizedBox(
                      height: 40,
                    ),
                  ],
                ),
              ),
              Positioned(
                top: 260,
                left: 0,
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Container(
                    width: 400,
                    height: 800,
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20.0),
                        topRight: Radius.circular(20.0),
                      ),
                      color: Colors.white,
                    ),
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 20,
                        ),
                        const Row(
                          children: [
                            SizedBox(
                              width: 50,
                            ),
                            Text(
                              '발견',
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.w700),
                            ),
                            SizedBox(
                              width: 50,
                            ),
                            Text(
                              "분실",
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.w700),
                            ),
                          ],
                        ),
                        ListView(
                          scrollDirection: Axis.vertical,
                          children: [
                            mainpageFrame(),
                            mainpageFrame(),
                            mainpageFrame(),
                          ],
                        ),
                      ],
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
