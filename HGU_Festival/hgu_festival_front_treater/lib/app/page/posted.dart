import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:hgu_sw_festival/api.dart';
import 'package:hgu_sw_festival/app/page/appBar.dart';
import 'package:hgu_sw_festival/app/page/chat.dart';
import 'package:hgu_sw_festival/app/page/chatRoom.dart';
import 'package:hgu_sw_festival/app/page/someonePage.dart';
import 'package:hgu_sw_festival/getUserProfile.dart';
import 'package:hgu_sw_festival/postedApi.dart';
import 'package:hgu_sw_festival/resentPostlist.dart';

class PostedPage extends StatefulWidget {
  final String? imageURL;
  final int? index;

  const PostedPage({Key? key, this.imageURL, this.index}) : super(key: key);

  @override
  State<PostedPage> createState() => _PostedPageState();
}

class _PostedPageState extends State<PostedPage> {
  late String imagesURL;
  late int? currentIndex;

  @override
  void initState() {
    super.initState();
    currentIndex = widget.index;

    if (widget.imageURL != null) {
      imagesURL = widget.imageURL!;
      print("posted imagesURL : $imagesURL");
    } else {
      imagesURL = 'Your default image URL';
    }
  }

  @override
  Widget build(BuildContext context) {
    String views = view?.toString() ?? '';

    return FutureBuilder(
      future: getPostedView(
          numberList[currentIndex ?? 0], accessToken, refreshToken),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          // 데이터를 기다리는 동안 로딩 인디케이터를 표시
          return const CircularProgressIndicator();
        } else if (snapshot.hasError) {
          // 오류가 발생한 경우 오류 메시지를 표시
          return Text("Error: ${snapshot.error}");
        } else {
          // 데이터가 준비되면 해당 데이터를 화면에 표시
          print('before in posted.dart : $userNamesss');

          print('afterin posted.dart : $userNamesss');
          String views = view?.toString() ?? '';
          return MaterialApp(
            home: Scaffold(
              body: Container(
                width: 393,
                height: 852 - 2,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/images/postingBackground.png'),
                  ),
                ),
                child: Column(
                  children: [
                    const SizedBox(
                      height: 65,
                    ),
                    appBar(context),
                    const SizedBox(
                      height: 40,
                    ),
                    FutureBuilder<void>(
                      future: precacheImage(NetworkImage(imagesURL), context),
                      builder:
                          (BuildContext context, AsyncSnapshot<void> snapshot) {
                        if (snapshot.connectionState == ConnectionState.done) {
                          return Container(
                            width: 343,
                            height: 266,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15.0),
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(15.0),
                              child: Image.network(
                                imagesURL,
                                fit: BoxFit.cover,
                              ),
                            ),
                          );
                        } else {
                          return Container(
                            width: 343,
                            height: 266 - 2,
                            decoration: const BoxDecoration(
                              borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(7.0),
                                bottomRight: Radius.circular(7.0),
                                topLeft: Radius.circular(7.0),
                                topRight: Radius.circular(7.0),
                              ),
                            ),
                            child: const Image(
                              fit: BoxFit.fill,
                              image: AssetImage('assets/images/loading.png'),
                            ),
                          );
                        }
                      },
                    ),

                    // const SizedBox(
                    //   height: 288,
                    //   width: 316,
                    //   child: Image.network(imagesURL, fit: BoxFit.cover),
                    // ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        const SizedBox(
                          width: 20,
                        ),
                        ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const SomeonePage(),
                              ),
                            );
                          },
                          child: Text(
                            '$userNamesss',
                            style: const TextStyle(
                                color: Colors.black,
                                fontSize: 11,
                                decoration: TextDecoration.none),
                          ),
                        ),
                        const SizedBox(
                          width: 180,
                        ),
                        Text(
                          "$views watched",
                          style: const TextStyle(
                              color: Colors.black,
                              fontSize: 8,
                              decoration: TextDecoration.none),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Container(
                      height: 231,
                      width: 316 - 2,
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(207, 232, 250, 195),
                        border: Border.all(
                          color: const Color.fromARGB(255, 175, 210, 146),
                          width: 3,
                        ),
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      child: Column(
                        children: [
                          const SizedBox(
                            height: 11,
                          ),
                          Text(
                            postNameList[currentIndex ?? 0],
                            style: const TextStyle(
                              fontWeight: FontWeight.w900,
                              fontSize: 23,
                            ),
                          ),
                          Text(
                            '분실 날짜 및 시간 | ${postDateList[currentIndex ?? 0]}',
                            style: const TextStyle(
                                fontSize: 15, fontWeight: FontWeight.w500),
                          ),
                          Container(
                            height: 5,
                            width: 250,
                            color: const Color.fromARGB(247, 196, 235, 113),
                          ),
                          Text(
                            '분실 장소 | ${perfectPostLostPlaceList[currentIndex ?? 0]}',
                            style: const TextStyle(
                                fontSize: 15, fontWeight: FontWeight.w500),
                          ),
                          Container(
                            height: 5,
                            width: 250,
                            color: const Color.fromARGB(247, 196, 235, 113),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Container(
                            height: 125 - 8 - 1,
                            width: 316,
                            decoration: const BoxDecoration(
                              color: Color.fromARGB(223, 247, 255, 229),
                              borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(15.0),
                                bottomRight: Radius.circular(15.0),
                              ),
                            ),
                            child: Column(
                              children: [
                                const SizedBox(
                                  height: 10,
                                ),
                                const Padding(
                                  padding: EdgeInsets.only(right: 170),
                                  child: Text(
                                    '자세한 설명',
                                    style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.w800),
                                  ),
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                Container(
                                  padding: const EdgeInsets.only(left: 28),
                                  width: 299,
                                  child:
                                      Text(postContentList[currentIndex ?? 0]),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 50 - 30,
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor:
                              const Color.fromARGB(255, 251, 255, 243),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(13.0),
                          )),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const ChatRoomPage(),
                          ),
                        );
                      },
                      child: Container(
                        width: 317,
                        height: 41,
                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                        child: const Text(
                          '채팅하러 가기',
                          textAlign: TextAlign.center,
                          style: TextStyle(color: Colors.black),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        }
      },
    );
  }
}
