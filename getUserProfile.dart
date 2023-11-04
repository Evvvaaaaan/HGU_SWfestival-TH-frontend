import 'dart:convert';
import 'package:hgu_sw_festival/api.dart';
import 'package:http/http.dart' as http;

int? points;
int? ratesum;
int? countOfRate;

Future<int?> sendPoint() async {
  final url = Uri.parse(
      'http://raspinas.iptime.org:64000/api/v1/user?access_token=$accessToken&token_type="bearer"&refresh_token=$refreshToken');

  final response = await http.get(
    url,
    headers: <String, String>{
      'Content-Type': 'application/json',
    },
  );

  if (response.statusCode == 200) {
    // 요청이 성공하면 응답에서 데이터를 추출합니다.
    final responseData = jsonDecode(response.body);
    // accessToken = responseData['token']['access_token'] ?? '';
    // refreshToken = responseData['token']['refresh_token'] ?? '';
    points = responseData['data']['point'];
    ratesum = responseData['data']['ratesum'];
    countOfRate = responseData['data']['countOfRate'];

    print('point ');
    return points;
  } else {
    // 요청이 실패한 경우 오류를 처리할 수 있습니다.
    print('POST 요청 실패');
    print('상태 코드: ${response.statusCode}');
    print('응답 데이터: ${response.body}');
    return points;
  }
}
