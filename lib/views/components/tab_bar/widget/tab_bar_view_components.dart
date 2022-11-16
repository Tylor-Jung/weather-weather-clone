import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weather_weather_clone/core/controller/home_controller.dart';
import 'package:weather_weather_clone/views/components/tab_bar/tab_bar_screens/humidity_screen.dart';
import 'package:weather_weather_clone/views/components/tab_bar/tab_bar_screens/rain_screen.dart';
import 'package:weather_weather_clone/views/components/tab_bar/tab_bar_screens/sensible_temp_screen.dart';
import 'package:weather_weather_clone/views/components/tab_bar/tab_bar_screens/temp_screen.dart';
import 'package:weather_weather_clone/views/components/tab_bar/tab_bar_screens/ultra_ray_screen.dart';
import 'package:weather_weather_clone/views/components/tab_bar/tab_bar_screens/wind_Screen.dart';

class TabBarViewWidget extends StatelessWidget {
  TabBarViewWidget({super.key});
  final HomeController tapCtrl = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      color: Colors.blue,
      child: TabBarView(
        controller: tapCtrl.tabController,
        children: const [
          TempScreen(),
          SensibleTempScreen(),
          UltraRayScreen(),
          RainScreen(),
          WindScreen(),
          HumidityScreen(),
        ],
      ),
    );
  }
}
