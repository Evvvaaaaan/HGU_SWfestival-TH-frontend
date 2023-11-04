import 'package:flutter/material.dart';
import 'package:hgu_sw_festival/app/page/main_page.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Container(
          width: 392,
          height: 852,
          color: const Color.fromRGBO(248, 255, 234, 1),
          child: Column(
            children: [
              const SizedBox(
                height: 55,
              ),
              Row(
                children: [
                  IconButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const MainPage(),
                        ),
                      );
                    },
                    icon: const Icon(Icons.arrow_back_ios_new_rounded),
                  ),

                  // Wrap the TextField in Expanded
                  SizedBox(
                    width: 285,
                    height: 41,
                    child: TextField(
                      decoration: const InputDecoration(
                        contentPadding: EdgeInsets.only(top: 1),
                        hintText: '검색',
                        prefixIcon: Icon(Icons.search),
                        border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(10.0)),
                            borderSide: BorderSide.none),
                        filled: true,
                        fillColor: Color(0xFFF3DEAA),
                      ),
                      onChanged: (text) {
                        // 사용자가 입력한 내용을 확인하거나 처리할 수 있음
                        print('입력된 검색어: $text');
                      },
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
