import 'package:geocoding/geocoding.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

// 위도(latitude)와 경도(longitude) 값
String? data;
Future<String> getAddress(double latitude, double longitude) async {
  // 위도와 경도를 사용하여 주소 검색
  String gpsUrl =
      'https://maps.googleapis.com/maps/api/geocode/json?latlng=$latitude,$longitude&key=AIzaSyADQfGNN2F4_wTPveNAKa-9zagcuPaQl_U';

  final responseGps = await http.get(Uri.parse(gpsUrl));

  // print(data);
  try {
    List<Placemark> placemarks =
        await placemarkFromCoordinates(latitude, longitude);
    Placemark place = placemarks[0];
    String address =
        '${place.street}, ${place.locality}, ${place.administrativeArea}, ${place.country}';

    print('adress : $address');
    return address;
  } catch (e) {
    return '주소를 찾을 수 없습니다.';
  }
}

// 위 함수를 호출하여 주소 검색
