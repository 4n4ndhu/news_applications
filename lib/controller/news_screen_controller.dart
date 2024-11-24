import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:news_applications/model/news_screen_model.dart';

class NewsScreenController with ChangeNotifier {
  String categoryIndex = "business";
  bool isLoading = false;
  List<String> category = [
    "business",
    "entertainment",
    "general",
    "health",
    "science",
    "sports",
    "technology"
  ];
  List<News> dataList = [];

  Future getData() async {
    isLoading = true;
    notifyListeners();
    final url = Uri.parse(
        "https://newsapi.org/v2/everything?q=$categoryIndex&apiKey=e0533ab11900474fa12c7772251ca74b");

    try {
      var response = await http.get(url);

      if (response.statusCode == 200) {
        NewsScreenModel newsScreenRes = newsScreenModelFromJson(response.body);
        dataList = newsScreenRes.articles ?? [];
      }
    } catch (e) {}
    isLoading = false;
    notifyListeners();
  }
}
