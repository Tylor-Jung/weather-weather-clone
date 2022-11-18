import 'package:get/get.dart';
import 'package:weather_weather_clone/core/controller/home_controller.dart';
import 'package:weather_weather_clone/core/controller/weather_controller.dart';

class InitBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => WeatherController());
    Get.lazyPut(() => HomeController());
  }
}
