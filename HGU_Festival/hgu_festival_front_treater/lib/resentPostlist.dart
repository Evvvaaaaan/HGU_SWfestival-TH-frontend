import 'dart:convert';
import 'package:http/http.dart' as http;

List<int> numberList = [];
List<String> postNameList = [];
List<String> postDateList = [];
List<String> postContentList = [];
List<String> postLostPlaceList = [];
List<String> perfectPostLostPlaceList = [];
List<int> lostPostNumberss = [];
List<int> findPostNumbers = [];

Future<bool> resentPostlist() async {
  final url = Uri.parse(
      'http://raspinas.iptime.org:64000/api/v1/posting/list/recent?numberOfPost=60');

  final response = await http.get(
    url,
    headers: <String, String>{
      'Content-Type': 'application/json',
    },
    // body: jsonEncode(requestBody),
  );

  if (response.statusCode == 200) {
    postNameList = [];
    postContentList = [];
    postDateList = [];
    postLostPlaceList = [];
    perfectPostLostPlaceList = [];
    lostPostNumberss = [];
    findPostNumbers = [];

    // If the request is successful, process the response data
    // .
    // final responseData = jsonDecode(response.body);
    // List<String> postNameList = [];
    var decoded = jsonDecode(utf8.decode(response.bodyBytes));

    // var responsedatas = jsonDecode(utf8.decode(responseData));
    if (decoded.containsKey("postList")) {
      var postList = decoded["postList"];
      if (postList is List) {
        for (var post in postList) {
          if (post is Map<String, dynamic> && post.containsKey("postName")) {
            String postName = post['postName'];

            postNameList.add(postName);
          }
        }
      }
    }
    if (decoded.containsKey("postList")) {
      var postList = decoded["postList"];
      if (postList is List) {
        for (var post in postList) {
          if (post is Map<String, dynamic> && post.containsKey("lostPlace")) {
            String postLostPlace = post['lostPlace'];
            postLostPlaceList.add(postLostPlace);
          }
        }
      }
    }

    perfectPostLostPlaceList = postLostPlaceList
        .map((String item) =>
            item.replaceAll('대한민국', '').replaceAll(RegExp(r', $'), ''))
        .toList();
    if (decoded.containsKey("postList")) {
      var postList = decoded["postList"];
      if (postList is List) {
        for (var post in postList) {
          if (post is Map<String, dynamic> && post.containsKey("postDate")) {
            String postDate = post['postDate'];
            postDateList.add(postDate);
          }
        }
      }
    }
    if (decoded.containsKey("postList")) {
      var postList = decoded["postList"];
      if (postList is List) {
        for (var post in postList) {
          if (post is Map<String, dynamic> && post.containsKey("content")) {
            String content = post['content'];
            postContentList.add(content);
          }
        }
      }
    }

    if (decoded.containsKey('postList')) {
      Set<int> uniqueNumbers = <int>{};

      for (var post in decoded['postList']) {
        if (post.containsKey('postNumber')) {
          int postNumber = post['postNumber'];
          uniqueNumbers.add(postNumber);
        } else {
          break;
        }
      }

      numberList = uniqueNumbers.toList();

      if (decoded.containsKey("postList")) {
        var postList = decoded["postList"];
        if (postList is List) {
          for (var post in postList) {
            if (post is Map<String, dynamic> &&
                post.containsKey("postType") &&
                post["postType"] == "lost" &&
                post.containsKey("postNumber")) {
              int postNumber = post['postNumber'];
              lostPostNumberss.add(postNumber);
            }
          }
          // Now you have the list of post numbers with postType "lost" in lostPostNumbers
        }
      }
      if (decoded.containsKey("postList")) {
        var postList = decoded["postList"];
        if (postList is List) {
          for (var post in postList) {
            if (post is Map<String, dynamic> &&
                post.containsKey("postType") &&
                post["postType"] == "found" &&
                post.containsKey("postNumber")) {
              int postNumber = post['postNumber'];
              findPostNumbers.add(postNumber);
            }
          }
          // Now you have the list of post numbers with postType "lost" in lostPostNumbers
        }
      }

      // List<int> findPostNumbers = [];
      // for (var post in decoded) {
      //   if (post['postType'] == 'find') {
      //     findPostNumbers.add(post['postNumber'] as int);
      //   }
      // }

      print('lostPostNumbers: $lostPostNumberss');
      print('findPostNumbers: $findPostNumbers');
      // print('findPostNumbers: $findPostNumbers');

      print('resentPostList.dart, numberList : $numberList');
      print('resentPostList.dart, nameList : $postNameList');
      print('resentPostList.dart, postContentList : $postContentList');
      print('resentPostList.dart, postLostPlaceList : $postLostPlaceList');
      print(
          'resentPostList.dart, perfectpostLostPlaceList : $perfectPostLostPlaceList');

      return true;
    }
  }

  // Default to returning false in case of any error
  return false;
}
