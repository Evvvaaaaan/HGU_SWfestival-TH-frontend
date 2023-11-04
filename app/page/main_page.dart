// import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hgu_sw_festival/app/page/chat.dart';
import 'package:hgu_sw_festival/app/page/login_page.dart';
import 'package:hgu_sw_festival/app/page/myPage.dart';
import 'package:hgu_sw_festival/app/page/posted.dart';
import 'package:hgu_sw_festival/app/page/postinfound.dart';
import 'package:hgu_sw_festival/app/page/posting.dart';
import 'package:hgu_sw_festival/app/page/search.dart';
import 'package:hgu_sw_festival/app/page/start.dart';
import 'package:hgu_sw_festival/getAdress.dart';
import 'package:hgu_sw_festival/getInfo.dart';
import 'package:hgu_sw_festival/postingApi.dart';
import 'package:hgu_sw_festival/resentPostlist.dart';
import 'package:hgu_sw_festival/userPicturegetApi.dart';
import 'package:intl/number_symbols_data.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:hgu_sw_festival/api.dart';

_openPopup(context) {
  Alert(
    useRootNavigator: false,
    style: const AlertStyle(
      backgroundColor: Color.fromARGB(255, 199, 219, 158),
    ),
    context: context,
    content: SizedBox(
      width: 328,
      height: 355,
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          TextButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const Posting(),
                ),
              );
            },
            child: Container(
              alignment: Alignment.center,
              width: 267,
              height: 107,
              decoration: BoxDecoration(
                color: const Color.fromARGB(216, 248, 255, 234),
                borderRadius: BorderRadius.circular(20.0),
              ),
              child: const Text(
                '잃어버렸어요',
                style: TextStyle(color: Colors.black),
              ),
            ),
          ),
          TextButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const Posting2(),
                ),
              );
            },
            child: Container(
              alignment: Alignment.center,
              width: 267,
              height: 107,
              decoration: BoxDecoration(
                color: const Color.fromARGB(216, 248, 255, 234),
                borderRadius: BorderRadius.circular(20.0),
              ),
              child: const Text(
                '발견했어요',
                style: TextStyle(color: Colors.black),
              ),
            ),
          ),
        ],
      ),
    ),
  ).show();
}

Widget mainpageFrame(BuildContext context, String imageURL, int index) {
  imageURL =
      'https://hguswfestivalthbackenddb.blob.core.windows.net/post-picture/$imageURL-1.jpeg';
  print('main_page에서 mainpageFrame을 호출하면 생성되는 PostNameList : $postNameList');

  return SizedBox(
    width: 165,
    height: MediaQuery.of(context).size.height - 420,
    child: Stack(
      children: [
        Positioned(
          top: 0,
          left: 0,
          child: GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => PostedPage(
                    imageURL: imageURL,
                    index: index,
                  ),
                ),
              );
            },
            child: Container(
              width: 164,
              height: 97,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(7.0),
                  topRight: Radius.circular(7.0),
                ),
                color: Color.fromARGB(255, 243, 222, 170),
              ),
              child: Column(
                children: [
                  const SizedBox(
                    height: 15,
                  ),
                  Text(
                    postNameList[index],
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Text(
                    perfectPostLostPlaceList[index],
                    style: const TextStyle(fontSize: 11),
                  ),
                ],
              ),
            ),
          ),
        ),
        Positioned(
          top: 90,
          left: 0,
          child: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const PostedPage(),
                  ),
                );
              },
              child: FutureBuilder<void>(
                key: UniqueKey(),
                future: precacheImage(NetworkImage(imageURL), context),
                builder: (BuildContext context, AsyncSnapshot<void> snapshot) {
                  if (snapshot.connectionState == ConnectionState.done) {
                    return Container(
                      width: 164,
                      height: 189,
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(7.0),
                          bottomRight: Radius.circular(7.0),
                        ),
                      ),
                      child: Image.network(imageURL, fit: BoxFit.cover),
                    );
                  } else {
                    return Container(
                      width: 164,
                      height: 189,
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(7.0),
                          bottomRight: Radius.circular(7.0),
                        ),
                      ),
                      child: const Image(
                        fit: BoxFit.fill,
                        image: AssetImage('assets/images/loading.png'),
                      ),
                    );
                  }
                },
              )),
        ),
      ],
    ),
  );
}

class LinePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = const Color.fromARGB(255, 147, 147, 147)
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 1.0;

    final startPoint = Offset(-170, size.height / 2);
    final endPoint = Offset(size.width, size.height / 2);

    canvas.drawLine(startPoint, endPoint, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  bool _isExpanded = false;

  void _toggleExpansion() {
    setState(() {
      _isExpanded = !_isExpanded;
    });
  }

  String activeTab = 'Find';

  double getSizedBoxWidth() {
    if (activeTab == 'Find') {
      return 20.0; // Find 상태일 때 width: 20
    } else {
      return 100.0; // Lost 상태일 때 width: 60
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
          height: MediaQuery.of(context).size.height,
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
                height: MediaQuery.of(context).size.height,
                alignment: Alignment.center,
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    const SizedBox(
                      height: 65,
                    ),
                    Positioned(
                      top: 50,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          AnimatedContainer(
                            duration: const Duration(milliseconds: 300),
                            // curve: Curves.easeInOut,
                            width: _isExpanded ? 300 : 56,
                            height: 56,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              color: Colors.transparent,
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: _isExpanded
                                  ? [
                                      const SizedBox(
                                        width: 50,
                                      ),
                                      IconButton(
                                        padding: EdgeInsets.zero, // 안쪽 여백 제거
                                        constraints: const BoxConstraints(),
                                        color: Colors.white,
                                        splashColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
                                        onPressed: () {
                                          // userPictureApi();
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  const SearchPage(),
                                            ),
                                          );
                                        },
                                        icon: const Icon(
                                          Icons.search,
                                          size: 25,
                                        ),
                                      ),
                                      IconButton(
                                        padding: EdgeInsets.zero, // 안쪽 여백 제거
                                        constraints: const BoxConstraints(),
                                        color: Colors.white,
                                        splashColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
                                        onPressed: () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  const ChatPage(),
                                            ),
                                          );
                                        },
                                        icon: const Icon(
                                          Icons.chat_bubble_outlined,
                                          size: 20,
                                        ),
                                      ),
                                      IconButton(
                                        padding: EdgeInsets.zero, // 안쪽 여백 제거
                                        constraints: const BoxConstraints(),
                                        color: Colors.white,
                                        splashColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
                                        onPressed: () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  const MyPage(),
                                            ),
                                          );
                                        },
                                        icon: const Icon(
                                          Icons.person,
                                          size: 25,
                                        ),
                                      ),
                                      IconButton(
                                        padding: EdgeInsets.zero, // 안쪽 여백 제거
                                        constraints: const BoxConstraints(),
                                        color: Colors.white,
                                        splashColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
                                        onPressed: () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  const StartPage(),
                                            ),
                                          );
                                        },
                                        icon: const Icon(
                                          Icons.logout_outlined,
                                          size: 24,
                                        ),
                                      ),
                                      IconButton(
                                          padding: EdgeInsets.zero, // 안쪽 여백 제거
                                          constraints: const BoxConstraints(),
                                          color: Colors.white,
                                          splashColor: Colors.transparent,
                                          highlightColor: Colors.transparent,
                                          icon: const Icon(Icons.menu),
                                          onPressed: _toggleExpansion),
                                    ]
                                  : [
                                      IconButton(
                                          padding: EdgeInsets.zero, // 안쪽 여백 제거
                                          constraints: const BoxConstraints(),
                                          color: Colors.white,
                                          splashColor: Colors.transparent,
                                          highlightColor: Colors.transparent,
                                          icon: const Icon(Icons.menu),
                                          onPressed: _toggleExpansion),
                                    ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    const Text(
                      "Treater에서\n보물을 찾으세요!",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 24,
                          color: Colors.white,
                          fontWeight: FontWeight.w600),
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                  ],
                ),
              ),
              Positioned(
                top: 260,
                left: 0,
                child: Container(
                  width: 400,
                  height: MediaQuery.of(context).size.height,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20.0),
                      topRight: Radius.circular(20.0),
                    ),
                    color: Colors.white,
                  ),
                  // list view 써보기
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          const SizedBox(
                            width: 30,
                          ),
                          TextButton(
                            onPressed: () {
                              setState(() {
                                activeTab = 'Find'; // 'Find' 탭을 활성화
                              });
                            },
                            child: Text(
                              '발견',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 18,
                                fontWeight: activeTab == 'Find'
                                    ? FontWeight.w700
                                    : FontWeight.normal,
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          TextButton(
                            onPressed: () {
                              setState(() {
                                activeTab = 'Lost'; // 'Lost' 탭을 활성화
                              });
                            },
                            child: Text(
                              '분실',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 18,
                                fontWeight: activeTab == 'Lost'
                                    ? FontWeight.w700
                                    : FontWeight.normal,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          SizedBox(
                            width: getSizedBoxWidth(),
                          ),
                          Container(
                            height: 3,
                            width: 88,
                            color: Colors.black,
                          )
                        ],
                      ),
                      SizedBox(
                        width: 393.0,
                        height: 0.0,
                        child: CustomPaint(
                          size: const Size(20, 20),
                          painter: LinePainter(),
                        ),
                      ),
                      if (activeTab == 'Lost')
                        Expanded(
                          child: ListView.builder(
                            scrollDirection: Axis.vertical,
                            physics: const BouncingScrollPhysics(),
                            itemCount: (numberList.length / 2).ceil(),
                            itemBuilder: (BuildContext context, int index) {
                              final firstImageIndex = index * 2;
                              final secondImageIndex =
                                  (index * 2 + 1 < numberList.length)
                                      ? index * 2 + 1
                                      : null;
                              return Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Row(
                                    children: [
                                      const SizedBox(width: 20),
                                      Expanded(
                                        child: mainpageFrame(
                                            context,
                                            numberList[firstImageIndex]
                                                .toString(),
                                            firstImageIndex),
                                      ),
                                      if (secondImageIndex != null)
                                        Expanded(
                                          child: mainpageFrame(
                                              context,
                                              numberList[secondImageIndex]
                                                  .toString(),
                                              secondImageIndex),
                                        ),
                                    ],
                                  ),
                                ],
                              );
                            },
                          ),
                        ),
                      if (activeTab == 'Find')
                        Expanded(
                          child: ListView.builder(
                            scrollDirection: Axis.vertical,
                            physics: const BouncingScrollPhysics(),
                            itemCount: (numberList.length / 2).ceil(),
                            itemBuilder: (BuildContext context, int index) {
                              final firstImageIndex = index * 2;
                              final secondImageIndex =
                                  (index * 2 + 1 < numberList.length)
                                      ? index * 2 + 1
                                      : null;
                              return Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Row(
                                    children: [
                                      const SizedBox(width: 20),
                                      Expanded(
                                        child: mainpageFrame(
                                            context,
                                            numberList[firstImageIndex]
                                                .toString(),
                                            firstImageIndex),
                                      ),
                                      if (secondImageIndex != null)
                                        Expanded(
                                          child: mainpageFrame(
                                              context,
                                              numberList[secondImageIndex]
                                                  .toString(),
                                              secondImageIndex),
                                        ),
                                    ],
                                  ),
                                ],
                              );
                            },
                          ),
                        ),
                    ],
                  ),
                ),
              ),
              Positioned(
                top: 730,
                left: 275,
                child: Container(
                  width: 93,
                  height: 93,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: const Color.fromARGB(255, 247, 255, 194),
                    border: Border.all(
                      color: const Color.fromARGB(255, 125, 158, 53),
                      width: 4,
                    ),
                    image: const DecorationImage(
                      fit: BoxFit.none,
                      image: AssetImage('assets/images/TreasureBox.png'),
                    ),
                  ),
                  child: InkWell(
                    onTap: () {
                      _openPopup(context);

                      print('hello world');
                    },
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
