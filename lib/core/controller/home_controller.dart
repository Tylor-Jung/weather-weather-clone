import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weather_weather_clone/data/model/my_location_model.dart';
import 'package:weather_weather_clone/data/network/my_location_network.dart'; // jsonDecode 사용가능

class HomeController extends GetxController with GetTickerProviderStateMixin {
  late TabController tabController;

  double? currentLatitude;
  double? currentLongitude;

  @override
  void onInit() {
    getPosition();
    tabController = TabController(length: 6, vsync: this);
    super.onInit();
  }

  void getPosition() async {
    MyLocation myLocation = MyLocation();
    await myLocation.getMyCurrentLocation();
    currentLatitude = myLocation.myLatitude;
    currentLongitude = myLocation.myLongitude;

    MyLocationNetwork network = MyLocationNetwork(
        'https://samples.openweathermap.org/data/2.5/weather?q=London&appid=b1b15e88fa797225412429c1c50c122a1');

    var weatherData = await network.getJsonData();
    print(weatherData);
  }

  // void fetchData() async {
  // http.Response response = await http.get(Uri.parse(
  //     'https://samples.openweathermap.org/data/2.5/weather?q=London&appid=b1b15e88fa797225412429c1c50c122a1'));
  // if (response.statusCode == 200) {
  //   String jsonData = response.body;
  //   var parsingData = jsonDecode(jsonData);
  // *
  //     var weatherDescription = parsingData['weather'][0]['description'];
  //     var weatherMain = parsingData['weather'][0]['main'];
  //     var wind = parsingData['wind']['speed'];
  //     var cityName = parsingData['name'];
  //     var temp = parsingData['main']['temp'];
  //     var humidity = parsingData['main']['humidity'];
  //     var minTemp = parsingData['main']['minTemp'];
  //     var maxTemp = parsingData['main']['maxTemp'];

  //     print(weatherDescription);
  //     print(weatherMain);
  //     print(wind);
  //     print(cityName);
  //     print(temp);
  //     print(humidity);
  //     print(minTemp);
  //     print(maxTemp);
  //   } else {
  //     print(response.body);
  //   }
  // }

  final List<Tab> myTaps = <Tab>[
    const Tab(
      child: Text('온도'),
    ),
    const Tab(
      child: Text('체감'),
    ),
    const Tab(
      child: Text('자외선'),
    ),
    const Tab(
      child: Text('강수'),
    ),
    const Tab(
      child: Text('바람'),
    ),
    const Tab(
      child: Text('습도'),
    ),
  ];

  @override
  void onClose() {
    // TODO: implement onClose
    tabController.dispose();
    super.onClose();
  }
  // void _loadData() {
  // setTargetUser();

  // 포스트 리스트 로드
  // 사용자 정보 로드
  // }
}
