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

  @override
  void onInit() {
    getPosition();
    super.onInit();
  }

  Future<dynamic> getPosition() async {
    MyLocation myLocation = MyLocation();
    await myLocation.getMyCurrentLocation();
    currentLatitude = myLocation.myLatitude;
    currentLongitude = myLocation.myLongitude;

    MyLocationNetwork network = MyLocationNetwork(
        'https://api.openweathermap.org/data/2.5/weather?lat=$currentLatitude&lon=$currentLongitude&appid=$apiKey&units=metric');

    var weatherData = await network.getJsonData();
    print(weatherData);
    return WeatherModel.fromJson(weatherData);
  }
}
