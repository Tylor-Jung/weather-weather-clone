import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:weather_weather_clone/data/model/my_location_model.dart';
import 'package:weather_weather_clone/data/model/weather_model.dart';
import 'package:weather_weather_clone/data/network/my_location_network.dart';

//apiKey 변수설정
const apiKey = 'e0eec712a45b2a728c6ec140281f353f';

class WeatherController extends GetxController {
  // WeatherModel 객체생성
  WeatherModel weatherModel = WeatherModel();

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
  // 체감
  double? feelsLike;
  // 강수
  double? rain;
  // 기후 상태 아이콘
  int? status;
  SvgPicture? icon;

  @override
  void onInit() {
    getLocation();
    // updateData();
    // init error : 1 positional argument(s) expected, but 0 found.
    // Try adding the missing arguments.
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
      update();
    } catch (e) {
      Get.snackbar(
        'error message',
        '$e',
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

  void updateData(Map<String, dynamic> weatherData) {
    try {
      cityName = weatherData['name'];
      description = weatherData['weather'][0]['description'];
      temp = weatherData['main']['temp'].toDouble();
      minTemp = weatherData['main']['temp_min'].toDouble();
      maxTemp = weatherData['main']['temp_max'].toDouble();
      humidity = weatherData['main']['humidity'].toDouble();
      feelsLike = weatherData['main']['feels_like'].toDouble();
      wind = weatherData['wind']['speed'].toDouble();
      rain = weatherData['rain']['1h'];
      status = weatherData['weather'][0]['id'];

      //* WeatherModel에서 아이콘 데이터 가져오기
      icon = weatherModel.getWeatherIcon(status!);
    } catch (e) {
      Get.snackbar(
        'error message',
        '$e',
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }
}
