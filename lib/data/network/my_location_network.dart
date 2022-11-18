import 'package:http/http.dart' as http;
import 'dart:convert';

class MyLocationNetwork {
  // 생성자를 통해 URL을 입력 받도록 함.
  final String url;
  MyLocationNetwork(this.url);

  Future<dynamic> getJsonData() async {
    
    http.Response response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      String jsonData = response.body;
      var parsingData = jsonDecode(jsonData);
      return parsingData;
    }
  }
}
