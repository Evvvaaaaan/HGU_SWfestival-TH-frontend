import 'dart:convert';

import 'package:http/http.dart' as http;

Future<void> sendPostRequest() async {
  final url = Uri.parse('http://172.17.200.74:64000/api/v1/token');

  final Map<String, String> requestBody = {
    'email': 'string',
    'password': 'string',
  };

  final response = await http.post(
    url,
    headers: <String, String>{
      'Content-Type': 'application/json',
    },
    body: jsonEncode(requestBody),
  );

  if (response.statusCode == 200) {
    // 요청이 성공하면 응답에서 데이터를 추출합니다.
    final responseData = jsonDecode(response.body);
    final accessToken = responseData['access_token'];
    final tokenType = responseData['token_type'];
    final refreshToken = responseData['refresh_token'];

    // 추출한 데이터를 출력하거나 다른 작업을 수행할 수 있습니다.
    // print('Access Token: $accessToken\n');
    // print('Token Type: $tokenType\n');
    // print('Refresh Token: $refreshToken');
  } else {
    // 요청이 실패한 경우 오류를 처리할 수 있습니다.
    // print('POST 요청 실패');
    // print('상태 코드: ${response.statusCode}');
    // print('응답 데이터: ${response.body}');
  }
}
