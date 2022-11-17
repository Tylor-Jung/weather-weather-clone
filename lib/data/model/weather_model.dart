import 'package:flutter/material.dart';

class WeatherModel {
  // 도시이름
  final String? cityName;
  // 온도
  final double? temp;
  // 바람
  final double? wind;
  // 습도
  final double? humidity;
  // 최소기온
  final double? minTemp;
  // 최대기온
  final double? maxTemp;

  WeatherModel({
    this.cityName,
    this.temp,
    this.wind,
    this.humidity,
    this.minTemp,
    this.maxTemp,
  });

  factory WeatherModel.fromJson(Map<String, dynamic> json) {
    return WeatherModel(
      cityName: json['name'],
      temp: json['main']['temp'],
      wind: json['wind']['speed'],
      humidity: json['main']['humidity'],
      minTemp: json['main']['minTemp'],
      maxTemp: json['main']['maxTemp'],
    );
  }
}

  // Map<String, dynamic> get toMap {
  //   return {
  //     "cityName": cityName,
  //     "wind": wind,
  //     "temp": temp,
  //     "humidity": humidity,
  //     "minTemp": minTemp,
  //     "maxTemp": maxTemp,
  //   };
  // }
