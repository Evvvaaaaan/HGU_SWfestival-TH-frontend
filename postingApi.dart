import 'dart:convert';
import 'dart:ffi';
import 'package:hgu_sw_festival/getInfo.dart';
import 'package:hgu_sw_festival/resentPostlist.dart';
import 'package:http/http.dart' as http;

Future<int?> getPosing(
  String title,
  DateTime seletedDate,
  String detail,
  postType,
  longitude, // Use lowercase 'double'
  latitude, // Use lowercase 'double'
  accessToken,
  refreshToken,
  tokenType,
  adress,
) async {
  print(longitude);
  print(latitude);
  final url = Uri.parse('http://raspinas.iptime.org:64000/api/v1/posting');

  final Map<String, dynamic> requestBody = {
    "postName": title,
    "postType": postType,
    "postCategory": "string",
    "locationX": longitude, // Use the provided 'longitude' parameter
    "locationY": latitude, // Use the provided 'latitude' parameter
    "lostTime": seletedDate.toIso8601String(),
    "lostPlace": await adress,
    "content": detail,
    "access_token": accessToken,
    "refresh_token": refreshToken,
    "token_type": "bearer",
  };

  final response = await http.post(
    url,
    headers: <String, String>{
      'Content-Type': 'application/json',
    },
    body: jsonEncode(requestBody),
  );

  if (response.statusCode == 200) {
    final responseData = jsonDecode(response.body);
    final int? postNumber = responseData['data']['postNumber'];
    print(responseData);
    print(postNumber);
    resentPostlist();

    return postNumber;
  } else {
    print('POST 요청 실패');
    print('상태 코드: ${response.statusCode}');
    print('응답 데이터: ${response.body}');
    return null; // Return null or appropriate error handling here
  }
}
