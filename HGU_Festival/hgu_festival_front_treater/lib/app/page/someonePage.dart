import 'package:flutter/material.dart';
import 'package:hgu_sw_festival/app/page/afterTrade.dart';
import 'package:hgu_sw_festival/app/page/appBar.dart';
import 'package:hgu_sw_festival/app/page/profileEdit.dart';
import 'package:hgu_sw_festival/getUserProfile.dart';
import 'package:hgu_sw_festival/resentPostlist.dart';
import 'package:http/http.dart';

Widget postInfo() {
  return Padding(
    padding: const EdgeInsets.all(7),
    child: Container(
      width: 347,
      height: 447,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: const Color.fromARGB(255, 248, 255, 234),
      ),
      padding: const EdgeInsets.only(
        left: 28,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 16,
          ),
          const Text(
            '게시물 정보',
            style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 16,
                color: Colors.black,
                decoration: TextDecoration.none),
          ),
          const SizedBox(
            height: 10,
          ),
          Container(
            width: 287,
            height: 196,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12.0),
              image: const DecorationImage(
                image: AssetImage('assets/images/cat.jpeg'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(
            height: 28,
          ),
          Container(
            width: 287,
            height: 135,
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 216, 234, 179),
              borderRadius: BorderRadius.circular(15.0),
            ),
            padding: const EdgeInsets.only(left: 17),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 22,
                ),
                Text(
                  '분실 날짜 및 시간 | \n${postDateList[1]}',
                  style: const TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w700,
                    fontSize: 15,
                    decoration: TextDecoration.none,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  '분실 장소 | ${perfectPostLostPlaceList[1]}',
                  style: const TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w700,
                    fontSize: 15,
                    decoration: TextDecoration.none,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    ),
  );
}

class SomeonePage extends StatefulWidget {
  const SomeonePage({super.key});

  @override
  State<SomeonePage> createState() => _MyPageState();
}

class _MyPageState extends State<SomeonePage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Container(
        width: 393,
        height: 852,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/myPageBackground.png'),
          ),
        ),
        child: Column(
          children: [
            const SizedBox(
              height: 58,
            ),
            appBar(context),
            const SizedBox(
              height: 35,
            ),
            Row(
              children: [
                const SizedBox(
                  width: 36,
                ),
                Container(
                  alignment: Alignment.topLeft,
                  width: 110,
                  height: 110,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/images/profile.png'),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 30,
                ),
                const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '이삼순',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                        decoration: TextDecoration.none,
                      ),
                      textAlign: TextAlign.start,
                    ),
                    Text(
                      '999',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                        decoration: TextDecoration.none,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(
              height: 38,
            ),
            Container(
              width: 343,
              height: 38,
              decoration: BoxDecoration(
                color: const Color.fromARGB(243, 255, 207, 95),
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: SizedBox(
                // Use SizedBox for fixed size
                width: double
                    .infinity, // Expand button to fill the Container horizontally
                height: double
                    .infinity, // Expand button to fill the Container vertically
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const AfterTradePage(),
                      ),
                    );
                  },
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(
                      Colors
                          .transparent, // Make the button background transparent
                    ),
                    elevation: MaterialStateProperty.all<double>(
                        0), // Remove button elevation
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(
                            8.0), // Match container's border radius
                      ),
                    ),
                  ),
                  child: const Text(
                    '후기 보러가기',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 49,
            ),
            SizedBox(
              height: 447,
              width: 343,
              child: PageView(
                scrollDirection: Axis.horizontal,
                children: <Widget>[
                  postInfo(),
                  postInfo(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
