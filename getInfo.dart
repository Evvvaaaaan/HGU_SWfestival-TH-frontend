import 'dart:convert';
import 'package:http/http.dart' as http;

Future<String> getInfo(imageURL) async {
  int? number = int.tryParse(imageURL);
  final response = await http.get(
    Uri.parse(
        'http://raspinas.iptime.org:64000/api/v1/posting?postNumber=$number'),
    headers: <String, String>{
      'Content-Type': 'application/json',
    },
  );

  if (response.statusCode == 200) {
    // 요청이 성공하면 응답에서 데이터를 추출합니다.
    // Map<String, dynamic> responseMap = jsonDecode(response.body);
    // var encoded = utf8.encode(response.body); // response.body의 인코딩을 utf-8로 설정
    // var decoded = json.decode(utf8.decode(encoded)); // utf-8로 디코딩

    var decoded = jsonDecode(utf8.decode(response.bodyBytes));
    // 필드 값 추출
    var data = decoded['data'];
    String postsName = data['postName'];
    int postUserNumber = data['postUserNumber'];
    String lostTime = data['lostTime'];
    String lostPlace = data['lostPlace'];
    int numberOfChat = data['numberOfChat'];
    bool disabled = data['disabled'];
    int postNumber = data['postNumber'];
    String postDate = data['postDate'];
    String postCategory = data['postCategory'];
    double locationX = data['locationX'];
    double locationY = data['locationY'];
    int views = data['views'];
    String content = data['content'];

    // 각 필드 변수에 저장된 값 출력
    print('Post Naeeeeme: $postsName');
    // print('Post User Number: $postUserNumber');

    // print('Lost Time: $lostTime');
    // print('Lost Place: $lostPlace');
    // print('Number of Chat: $numberOfChat');
    // print('Disabled: $disabled');
    // print('Post Number: $postNumber');
    // print('Post Date: $postDate');
    // print('Post Category: $postCategory');
    // print('Location X: $locationX');
    // print('Location Y: $locationY');
    // print('Views: $views');
    // print('Content: $content');
    return postsName;
  } else {
    // 요청이 실패한 경우 오류를 처리할 수 있습니다.
    print('POST 요청 실패');
    print('상태 코드: ${response.statusCode}');
    print('응답 데이터: ${response.body}');
    return 'false';
  }
}
