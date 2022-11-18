import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class WeatherModel {
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
  // 기후 상태 아이콘
  int? status;
  SvgPicture? icon;

  SvgPicture? getWeatherIcon(int status) {
    if (status < 300) {
      return SvgPicture.asset(
        'assets/svg/climacon-cloud_lightning.svg',
        color: Colors.black87,
      );
    } else if (status < 600) {
      return SvgPicture.asset('assets/svg/climacon-cloud_snow.svg',
          color: Colors.black87);
    } else if (status == 800) {
      return SvgPicture.asset('assets/svg/climacon-sun.svg',
          color: Colors.black87);
    } else if (status <= 804) {
      return SvgPicture.asset('assets/svg/climacon-cloud_sun.svg',
          color: Colors.black87);
    }
    return null;
  }

  WeatherModel(
      {this.cityName,
      this.description,
      this.temp,
      this.wind,
      this.humidity,
      this.minTemp,
      this.maxTemp,
      this.status,
      this.icon});

  factory WeatherModel.fromJson(Map<String, dynamic> json) {
    return WeatherModel(
      cityName: json['name'],
      description: json['weather'][0]['description'],
      status: json['weather'][0]['id'],
      temp: json['main']['temp'],
      minTemp: json['main']['temp_min'],
      maxTemp: json['main']['temp_max'],
      humidity: json['main']['humidity'],
      wind: json['wind']['speed'],
    );
  }

  // Map<String, dynamic> get toMap {
  //   return {
  //     "cityName": cityName,
  //     "wind": wind,
  //     "temp": temp,
  //     "humidity": humidity,
  //     "temp_min": minTemp,
  //     "temp_max": maxTemp,
  //   };
  // }
}
