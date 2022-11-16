import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weather_weather_clone/core/controller/home_controller.dart';

class TabBarWidget extends StatelessWidget {
  const TabBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final HomeController tapCtrl = Get.put(HomeController());
    return SizedBox(
      // height: 30,
      width: 250,
      child: TabBar(
        indicatorColor: Colors.white,
        labelPadding: EdgeInsets.zero,
        controller: tapCtrl.tabController,
        tabs: tapCtrl.myTaps,
      ),
    );
  }
}
