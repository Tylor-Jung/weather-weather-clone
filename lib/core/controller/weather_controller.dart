import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:weather_weather_clone/data/model/my_location_model.dart';
import 'package:weather_weather_clone/data/network/my_location_network.dart';
import 'package:weather_weather_clone/views/home.dart';

//apiKey 변수설정
const apiKey = 'e0eec712a45b2a728c6ec140281f353f';

class WeatherController extends GetxController {
  // 위도
  double? currentLatitude;
  // 경도
  double? currentLongitude;
  // 도시이름
  String? cityName;
  // 온도
  double? temp;
  // 바람
  double? wind;
  // 습도
  double? humidity;
  // 최소기온
  double? minTemp;
  // 최대기온
  double? maxTemp;

  @override
  void onInit() {
    getLocation();
    super.onInit();
  }

  Future<dynamic> getLocation() async {
    MyLocation myLocation = MyLocation();
    await myLocation.getMyCurrentLocation();
    currentLatitude = myLocation.myLatitude;
    currentLongitude = myLocation.myLongitude;

    MyLocationNetwork network = MyLocationNetwork(
        'https://api.openweathermap.org/data/2.5/weather?lat=$currentLatitude&lon=$currentLongitude&appid=$apiKey&units=metric');

    var weatherData = await network.getJsonData();
    try {
      updateData(weatherData);
    } catch (e) {
      Text('$e');
    }
  }

  void updateData(Map<dynamic, dynamic> weatherData) {
    cityName = weatherData['name'];
    temp = weatherData['main']['temp'];
    // double wind = weatherData['wind']['speed'];
    // double humidity = weatherData['main']['humidity'];
    // double minTemp = weatherData['main']['minTemp'];
    // double maxTemp = weatherData['main']['maxTemp'];

    print(cityName);
    print(temp);
  }
}
