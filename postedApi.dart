import 'dart:convert';
import 'dart:ffi';
import 'package:hgu_sw_festival/getInfo.dart';
import 'package:hgu_sw_festival/resentPostlist.dart';
import 'package:http/http.dart' as http;

int? view;
String? userNamesss;

Future<void> getPostedView(
  number,
  accessToken,
  refreshToken,
) async {
  print('before get');
  final url = Uri.parse(
      'http://raspinas.iptime.org:64000/api/v1/posting?postNumber=$number&access_token=$accessToken&token_token=beaer&refresh_token=$refreshToken');

  final response = await http.get(
    url,
    headers: <String, String>{
      'Content-Type': 'application/json',
    },
  );

  if (response.statusCode == 200) {
    print('after success');
    final String decodedString = utf8.decode(response.bodyBytes);

    final responseData = jsonDecode(decodedString);
    // final responseData = jsonDecode(response.body);
    accessToken = responseData["token"]["access_token"];
    refreshToken = responseData["token"]["refresh_token"];
    view = responseData['data']['views'];
    userNamesss = responseData['data']['userName'];

    print('postedApi views: $view');
    print('postedApi userName: $userNamesss');
  } else {
    print('POST 요청 실패');
    print('상태 코드: ${response.statusCode}');
    print('응답 데이터: ${response.body}');
  }
}
