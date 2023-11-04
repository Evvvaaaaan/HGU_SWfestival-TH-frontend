import 'package:http/http.dart' as http;
import 'dart:convert';

Future<bool> signUp(String email, String password, String username) async {
  final url = Uri.parse('http://raspinas.iptime.org:64000/api/v1/user');

  // 요청 본문 데이터를 Map 형식으로 구성
  final Map<String, dynamic> requestBody = {
    "username": username,
    "email": email,
    "password": password,
    "locationX": 0,
    "locationY": 0
  };

  final response = await http.post(
    url,
    headers: <String, String>{
      'Content-Type': 'application/json',
    },
    body: jsonEncode(requestBody),
  );

  if (response.statusCode == 200) {
    // 요청이 성공하면 응답에서 데s이터를 추출합니다.

    print('success');

    return true;
  } else {
    // 요청이 실패한 경우 오류를 처리할 수 있습니다.
    print('POST 요청 실패');
    print('상태 코드: ${response.statusCode}');
    print('응답 데이터: ${response.body}');
    return false;
  }
}
