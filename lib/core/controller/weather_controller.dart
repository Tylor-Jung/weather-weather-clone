import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:weather_weather_clone/data/model/my_location_model.dart';
import 'package:weather_weather_clone/data/model/weather_model.dart';
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
  // 요약
  String? description;
  // 온도
  double? temp;
  // 최소기온
  double? minTemp;
  // 최대기온
  double? maxTemp;
  // 습도
  double? humidity;
  // 바람
  double? wind;

  @override
  void onInit() {
    getLocation();
    // updateData();
    //init error : 1 missing positional argument
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
      Get.snackbar('error message', '$e', snackPosition: SnackPosition.BOTTOM);
    }
  }

  void updateData(Map<String, dynamic> weatherData) {
    try {
      cityName = weatherData['name'];
      description = weatherData['weather'][0]['description'];
      temp = weatherData['main']['temp'];
      minTemp = weatherData['main']['temp_min'];
      maxTemp = weatherData['main']['temp_max'];
      humidity = weatherData['main']['humidity'];
      wind = weatherData['wind']['speed'];
    } catch (e) {
      Get.snackbar('error message', '$e');
    }

    print(cityName);
    print(temp);
  }
}
