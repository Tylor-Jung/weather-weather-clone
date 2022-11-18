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

  WeatherModel({
    this.cityName,
    this.description,
    this.temp,
    this.wind,
    this.humidity,
    this.minTemp,
    this.maxTemp,
  });

  factory WeatherModel.fromJson(Map<String, dynamic> json) {
    return WeatherModel(
      cityName: json['name'],
      description: json['weather'][0]['description'],
      temp: json['main']['temp'],
      minTemp: json['main']['temp_min'],
      maxTemp: json['main']['temp_max'],
      humidity: json['main']['humidity'],
      wind: json['wind']['speed'],
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
