import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

class MyLocation {
  double? myLatitude;
  // 위도
  double? myLongitude;
  // 경도

  Future<void> getMyCurrentLocation() async {
    try {
      LocationPermission permission = await Geolocator.requestPermission();
      Position myLocation = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high);
      myLatitude = myLocation.latitude;
      myLongitude = myLocation.longitude;
    } catch (e) {
      const Text('인터넷 연결에 문제가 발생했습니다.');
    }
  }
}



// class Announcement {
//   final String title;
//   final String body;
//   final DateTime createdAt;
//   final DateTime updatedAt;

//   Announcement(this.title, this.body, this.createdAt, this.updatedAt);

//   static Announcement fromJson(Map<String, dynamic> json) {
//     try {
//       final title = json["title"] as String;
//       final body = json["body"] as String;
//       final createdAt = DateTime.parse(json["created_at"] as String);
//       final updatedAt = DateTime.parse(json["updated_at"] as String);

//       return Announcement(title, body, createdAt, updatedAt);
//     } catch (error, stackTrace) {
//       AppLogHelper.showJsonParsingError(
//           modelName: "Announcement",
//           errorMessage: error.toString(),
//           stackTracce: stackTrace);
//       throw Exception(error);
//     }
//   }

//   Map<String, dynamic> get toMap {
//     return {
//       "title": title,
//       "body": body,
//       "created_at": createdAt.toString(),
//       "updated_at": updatedAt.toString()
//     };
//   }
// }
