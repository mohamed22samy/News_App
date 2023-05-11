import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:news_app/model/news_model.dart';

class NewsController extends GetxController {
  RxInt currentIndex = 0.obs;
  getData(String category) async {
    final url = Uri.parse(
        "https://newsapi.org/v2/top-headlines?country=us&category=${category}&apiKey=386d5e584b0e464e8e42cb0e5dbe2ba5");
    // final uri = Uri.http("newsapi.org",
    //     "v2/top-headlines?country=eg&apiKey=386d5e584b0e464e8e42cb0e5dbe2ba5");  ==>> two method <<==
    http.Response response = await http.get(url);
    if (response.statusCode == 200) {
      //200 = ok >>response.body // 400,500 = errore >>snakebar
      try {
        return Articles.fromJson(jsonDecode(response.body));
      } catch (e) {
        Get.snackbar("title", e.toString());
      }
    }
  }
}
