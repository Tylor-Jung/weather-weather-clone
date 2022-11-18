import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weather_weather_clone/core/controller/home_controller.dart';
import 'package:weather_weather_clone/core/controller/weather_controller.dart';
import 'package:weather_weather_clone/views/components/tab_bar/widget/tab_bar_components.dart';
import 'package:weather_weather_clone/views/components/tab_bar/widget/tab_bar_view_components.dart';

class Home extends StatefulWidget {
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final homeController = Get.find<HomeController>();
  final weatherController = Get.find<WeatherController>();
  final int _current = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            //드랍다운 메뉴
          },
          icon: const Icon(Icons.menu),
        ),
        actions: [
          Row(
            children: [
              IconButton(
                onPressed: () {
                  // 날씨정보 공유하기
                },
                icon: const Icon(
                  Icons.share,
                ),
              ),
              IconButton(
                onPressed: () {
                  // 추가하기?
                },
                icon: const Icon(
                  Icons.add,
                  size: 35,
                ),
              ),
            ],
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          color: Colors.blue,
          height: MediaQuery.of(context).size.height,
          child: Center(
            child: Column(
              children: [
                CarouselSlider(
                  options: CarouselOptions(
                    height: 450.0,
                  ),
                  items: [1, 2, 3, 4, 5].map((i) {
                    return Builder(
                      builder: (BuildContext context) {
                        return Container(
                            decoration: const BoxDecoration(color: Colors.blue),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(vertical: 10),
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  const Text(
                                    '(현재 위치)',
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 15),
                                  ), // 현재위치 text
                                  Text(
                                    '${weatherController.cityName}',
                                    style: const TextStyle(
                                        color: Colors.white, fontSize: 30),
                                  ),
                                  Text(
                                    '${weatherController.description}',
                                    style: const TextStyle(
                                        color: Colors.white, fontSize: 15),
                                  ), // 실시간 날씨
                                  SizedBox(
                                    height: 100,
                                    width: 100,
                                    child: weatherController.icon,
                                  ), // 날씨상황을 나타내는 아이콘
                                  Text(
                                    '${weatherController.temp}℃',
                                    style: const TextStyle(
                                        color: Colors.white, fontSize: 30),
                                  ), // 실제온도
                                  const Text(
                                    '어제보다 x℃ 가 높아요',
                                    style: TextStyle(
                                        color: Colors.black, fontSize: 15),
                                  ), // 어제와 비교, 높아요/낮아요
                                  Text(
                                    '최고 ${weatherController.maxTemp}℃ / 최저 ${weatherController.minTemp}℃',
                                    style: const TextStyle(
                                        color: Colors.white, fontSize: 15),
                                  ),
                                  const SizedBox(height: 5),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Container(
                                        width: 6,
                                        height: 6,
                                        margin: const EdgeInsets.symmetric(
                                            vertical: 10, horizontal: 3),
                                        decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            color: _current == i
                                                ? Colors.white
                                                : Colors.grey[100]),
                                      ),
                                      Container(
                                        width: 6,
                                        height: 6,
                                        margin: const EdgeInsets.symmetric(
                                            vertical: 10, horizontal: 3),
                                        decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            color: _current == i
                                                ? Colors.white
                                                : Colors.grey[100]),
                                      ),
                                      Container(
                                        width: 6,
                                        height: 6,
                                        margin: const EdgeInsets.symmetric(
                                            vertical: 10, horizontal: 3),
                                        decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            color: _current == i
                                                ? Colors.white
                                                : Colors.grey[100]),
                                      ),
                                      Container(
                                        width: 6,
                                        height: 6,
                                        margin: const EdgeInsets.symmetric(
                                            vertical: 10, horizontal: 3),
                                        decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            color: _current == i
                                                ? Colors.white
                                                : Colors.grey[100]),
                                      ),
                                      Container(
                                        width: 6,
                                        height: 6,
                                        margin: const EdgeInsets.symmetric(
                                            vertical: 10, horizontal: 3),
                                        decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            color: _current == i
                                                ? Colors.white
                                                : Colors.grey[100]),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ));
                      },
                    );
                  }).toList(),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 15, bottom: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    // 미세먼지 지수 // 우측정렬
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.blue[300],
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              SizedBox(
                                child: Image.asset(
                                  'assets/image/bad.png',
                                  width: 38,
                                  height: 38,
                                ),
                              ),
                              const SizedBox(width: 5), // 미세먼지에 따른 이미지 파일 집어넣기
                              Column(
                                children: const [
                                  Text(
                                    '미세미세',
                                    style: TextStyle(
                                      color: Colors.white,
                                    ),
                                  ),
                                  SizedBox(height: 4), // 미세미세 타이틀
                                  Text(
                                    '매우나쁨',
                                    style: TextStyle(
                                      color: Colors.white,
                                    ),
                                  ), // 미세먼지 데이터 특정 값 range 안에서 특정 메시지 출력
                                ],
                              )
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  color: Colors.blue[600],
                  // height: 30,
                  width: MediaQuery.of(context).size.width,
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        // ignore: prefer_const_literals_to_create_immutables
                        children: [
                          const SizedBox(width: 10),
                          const Text(
                            '오늘',
                            style: TextStyle(color: Colors.white),
                          ),
                          const SizedBox(width: 100),
                          const TabBarWidget(),
                        ],
                      ),
                      TabBarViewWidget(),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
