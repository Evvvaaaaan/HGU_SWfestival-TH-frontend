import 'dart:io';
import 'dart:ui';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:hgu_sw_festival/app/page/appBar.dart';
import 'package:hgu_sw_festival/app/page/global_variables.dart';
import 'package:hgu_sw_festival/app/page/loading.dart';
import 'package:hgu_sw_festival/app/page/main_page.dart';
import 'package:hgu_sw_festival/app/page/map.dart';
import 'package:hgu_sw_festival/app/page/posted.dart';
import 'package:hgu_sw_festival/getAdress.dart';
import 'package:hgu_sw_festival/postingApi.dart';
import 'package:hgu_sw_festival/postingApi2.dart';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart';
import 'package:image_picker/image_picker.dart';
// import 'package:hgu_sw_festival/app/page/main_page.dart';
import 'package:hgu_sw_festival/api.dart';
import 'package:intl/intl.dart';

class Posting2 extends StatelessWidget {
  const Posting2({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      resizeToAvoidBottomInset: false,
      body: Postings(),
    );
  }
}

class Postings extends StatefulWidget {
  const Postings({super.key});

  @override
  State<Postings> createState() => _PostingState();
}

class _PostingState extends State<Postings> {
  String? base64Image;
  String postType = 'found';
  File? _image;
  DateTime date = DateTime.now();
  TimeOfDay time = TimeOfDay.now();
  Future<void> _pickImage() async {
    final pickedFile =
        await ImagePicker().pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
        print(_image);
      });
      List<int> imageBytes = await _image!.readAsBytes();
      String base64Image = base64Encode(imageBytes);
    } else {
      _pickImage();
    }
  }

  Future<void> _selectTime(BuildContext context) async {
    TimeOfDay? initialTime = selectedTime;
    initialTime ??= TimeOfDay.now();
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: initialTime,
    );

    if (picked != null) {
      setState(
        () {
          time = picked;
          // selectedTime = picked;
          print('picked: $time');
        },
      );
    }
  }

  Future<int> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (picked != null) {
      setState(() {
        date = picked;
// print('picked date : $date');
      });
    }
    return 0;
  }

  final TextEditingController contextcontroller = TextEditingController();
  final TextEditingController titlecontroller = TextEditingController();
  TimeOfDay selectedTime = TimeOfDay.now();
  final selectedDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Container(
        width: 343,
        height: 852 + 49 + 38,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/postingBackground.png'),
          ),
        ),
        alignment: Alignment.center,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 50,
            ),
            appBar(context),
            const Padding(
              padding: EdgeInsets.only(left: 40),
              child: SizedBox(
                width: 237,
                height: 30,
                child: Text(
                  '제목',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 15,
                      decoration: TextDecoration.none),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 40),
              child: SizedBox(
                width: 237,
                height: 58,
                child: TextFormField(
                  controller: titlecontroller,
                  decoration: const InputDecoration(
                    hintText: '제목을 입력하세요.',
                    fillColor: Color.fromARGB(255, 254, 254, 254),
                    filled: true,
                  ),
                  obscureText: false,
                ),
              ),
            ),

            Row(
              children: [
                const Padding(
                  padding: EdgeInsets.only(left: 40),
                  child: Text(
                    '분실 위치 |',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 15,
                        decoration: TextDecoration.none),
                  ),
                ),
                const SizedBox(
                  width: 17,
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 255, 255, 255),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),

                  onPressed: () async {
                    LocationPermission permission =
                        await Geolocator.checkPermission();
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const MapScreen(),
                      ),
                    );
                    if (permission == LocationPermission.denied) {
                      permission = await Geolocator.requestPermission();
                      if (permission == LocationPermission.denied) {
                        // 사용자가 위치 정보 제공에 동의하지 않았음
                        return;
                      }
                    }
                    // Position position = await Geolocator.getCurrentPosition(
                    //   desiredAccuracy: LocationAccuracy.high,
                    // );
                    // 현재 위치를 불러오는 코드
                    // double latitude = position.latitude;
                    // double longitude = position.longitude;
                    double latitude = globalSelectedLocation.latitude;
                    double longitude = globalSelectedLocation.longitude;
                    getAddress(latitude, longitude).then((address) {
                      print('주소: $address');
                    }).catchError((error) {
                      print('에러 발생: $error');
                    });

                    print('latitude : $latitude, longitude : $longitude');
                    print('globaclSelectedLocation:globalSelectedLocation');
                  },
                  child: const Text(
                    '현재위치 자동으로 불러오기',
                    style: TextStyle(color: Colors.black),
                  ), // 버튼 텍스트 변경 가능
                )
              ],
            ),
            Row(
              children: [
                const Padding(
                  padding: EdgeInsets.only(left: 40),
                  child: Text(
                    '분실 날짜 |',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 15,
                        decoration: TextDecoration.none),
                  ),
                ),
                const SizedBox(
                  width: 17,
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 255, 255, 255),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),

                  onPressed: () {
                    _selectTime(context);
                  },
                  child: const Text(
                    ' 분실 시간 선택',
                    style: TextStyle(color: Colors.black),
                  ), // 버튼 텍스트 변경 가능
                )
              ],
            ),
            Row(
              children: [
                const Padding(
                  padding: EdgeInsets.only(left: 40),
                  child: Text(
                    '분실 시간 |',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 15,
                        decoration: TextDecoration.none),
                  ),
                ),
                const SizedBox(
                  width: 17,
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 255, 255, 255),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                  onPressed: () {
                    _selectDate(context);
                  },
                  child: const Text(
                    '    날짜 선택    ',
                    style: TextStyle(color: Colors.black),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 12,
            ),
            const Padding(
              padding: EdgeInsets.only(left: 40),
              child: Text(
                '자세한 설명',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 15,
                  decoration: TextDecoration.none,
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 40),
              child: SizedBox(
                width: 314,
                height: 78,
                child: TextFormField(
                  controller: contextcontroller,
                  decoration: const InputDecoration(
                    hintText: '내용을 입력하세요.',
                    fillColor: Color.fromARGB(255, 254, 254, 254),
                    filled: true,
                  ),
                  obscureText: false,
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 40),
              child: Text(
                '분실물 선택',
                style: TextStyle(
                    color: Colors.black,
                    decoration: TextDecoration.none,
                    fontSize: 15),
              ),
            ),
            const SizedBox(
              height: 20,
            ),

            Padding(
              padding: const EdgeInsets.only(left: 40),
              child: Container(
                width: 314,
                height: 224,
                decoration: BoxDecoration(
                  color: const Color.fromRGBO(254, 254, 254, 0.80),
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: _image == null
                    ? Padding(
                        padding: const EdgeInsets.only(left: 0),
                        child: SizedBox(
                          width: 314,
                          height: 224,
                          child: FloatingActionButton(
                            onPressed: _pickImage,
                            backgroundColor: Colors.white.withOpacity(1.0),
                            tooltip: 'Pick Image',
                            child: const Icon(
                              Icons.add_circle_outline_outlined,
                              size: 40,
                              color: Color.fromARGB(255, 255, 225, 148),
                            ),
                          ),
                        ),
                      )
                    : Padding(
                        padding: const EdgeInsets.all(10),
                        child: Image.file(
                          _image!,
                          width: 314,
                          height: 224,
                        ),
                      ),
              ),
            ),

            // Padding(
            //   padding: const EdgeInsets.only(left: 12.0),
            //   child: Container(
            //     width: 314,
            //     height: 224,
            //     decoration: BoxDecoration(
            //         color: const Color.fromARGB(0, 161, 41, 41),
            //         borderRadius: BorderRadius.circular(20.0)),
            //     child: const Image(
            //       fit: BoxFit.fill,
            //       image: AssetImage('assets/images/mainpage_background.png'),
            //     ),
            //   ),
            // ),
            const SizedBox(
              height: 20,
            ),
            Visibility(
              visible: _image != null,
              child: Padding(
                padding: const EdgeInsets.only(left: 25, right: 25),
                child: ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(
                      const Color.fromARGB(255, 248, 255, 234),
                    ),
                  ),
                  onPressed: () async {
                    String detail = contextcontroller.text;
                    String title = titlecontroller.text;
                    String twoDigits(int n) {
                      if (n >= 10) {
                        return "$n";
                      } else {
                        return "0$n";
                      }
                    }

                    String formattedDateTime =
                        "${date.year}-${twoDigits(date.month)}-${twoDigits(date.day)}T${twoDigits(time.hour)}:${twoDigits(time.minute)}:00";
                    DateTime dateTime = DateFormat("yyyy-MM-dd'T'HH:mm")
                        .parse(formattedDateTime);
                    print(formattedDateTime); // "2023-10-20 01:25"

                    print('real time: $selectedDate');
                    print('type: $postType');

                    int? postNumberFromGetPosing = await getPosing(
                      title,
                      dateTime,
                      detail,
                      postType,
                      globalSelectedLocation.latitude,
                      globalSelectedLocation.longitude,
                      accessToken,
                      refreshToken,
                      tokenType,
                      getAddress(globalSelectedLocation.latitude,
                          globalSelectedLocation.longitude),
                    );
                    print('postNumber :  $postNumberFromGetPosing');

                    await getPosting(
                      _image!,
                      accessToken,
                      refreshToken,
                      postNumberFromGetPosing,
                    );

                    // image, 닉네임, 글 쓰기 정보가 null이면, 버튼 비활성화 !!
                    if (_image != null) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const LodingPage(),
                        ),
                      );
                    } else {
                      print('Posting Fail');
                    }
                  },
                  child: Container(
                    width: 343,
                    height: 41,
                    alignment: Alignment.center,
                    // padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: const Text(
                      '작성 완료',
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
