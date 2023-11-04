import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';

Future<bool> getPosting(
  File imageFile, // 이미지 파일을 메서드에 전달
  accessToken,
  refreshToken,
  postNumber, // postNumber를 매개변수로 추가
) async {
  final url = Uri.parse(
      'http://raspinas.iptime.org:64000/api/v1/posting/picture?postNumber=$postNumber&pictureNumber=1&access_token=$accessToken&token_type=bearer&refresh_token=$refreshToken');

  // final response = await http.post(
  //   url,
  //   headers: <String, String>{
  //     'Content-Type': 'application/json',
  //   },
  //   body: jsonEncode(response.body),
  // );

  final request = http.MultipartRequest('POST', url);
  request.files.add(
    await http.MultipartFile.fromPath(
      'file',
      imageFile.path,
      contentType: MediaType('image', 'jpeg'),
    ),
  );

  final streamedResponse = await request.send();
  final response = await http.Response.fromStream(streamedResponse);

  if (response.statusCode == 200) {
    final responseData = jsonDecode(response.body);
    print(responseData);
    return true;
  } else {
    print('POST 요청 실패');
    print('상태 코드: ${response.statusCode}');
    print('응답 데이터: ${response.body}');
    return false;
  }
}
