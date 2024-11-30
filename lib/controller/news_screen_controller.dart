import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:news_applications/model/news_screen_model.dart';

class NewsScreenController with ChangeNotifier {
  String? categoryIndex;
  bool isLoading = false;
  List<String> category = [
    "All",
    "business",
    "entertainment",
    "general",
    "health",
    "science",
    "sports",
    "technology"
  ];
  List<News> dataList = [];
  List<News> filteredDataList = []; // Added filtered list
  List categoryImage = [
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTe2kgzyQG4etgOPcv3BXoPB_fGZokL_Rw_BXOcxSuZssYHRMVwPxsrTPRKVyirSt18UK0&usqp=CAU",
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTqIld0gDwIL70secUhQLzLLSiNNQ7HozmOQg&s",
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRkggu5LvEsp0GLaHbGvuTny1gQ03YUlr3lGg&s",
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSfAI_a3tzOjLGgTMN4VFkiMlK_Ol6T7OEffw&s",
    "https://as1.ftcdn.net/v2/jpg/01/44/78/46/1000_F_144784631_uYbBlCmvFjTRpw46ld9LnRzz1aYL1QJl.jpg",
    "https://yt3.googleusercontent.com/0QxU2BCEv3pc0pcrCBDJSqy6dEACCFy4V2xloHl88ZWXwswi1hKJZrzNGa53q9b0YiUEkw0G5g=s900-c-k-c0x00ffffff-no-rj",
    "https://thumbs.dreamstime.com/b/emblem-logo-design-illustrator-vector-sport-news-isolated-white-background-sports-162216328.jpg",
    "https://mir-s3-cdn-cf.behance.net/project_modules/max_1200/4df51c55602737.560991261a121.jpg",
  ];

  // Get the data from the API
  Future getData() async {
    isLoading = true;
    notifyListeners();

    final url = Uri.parse(categoryIndex == null
        ? "https://newsapi.org/v2/everything?q=All&apiKey=e0533ab11900474fa12c7772251ca74b"
        : "https://newsapi.org/v2/everything?q=$categoryIndex&apiKey=e0533ab11900474fa12c7772251ca74b");

    try {
      var response = await http.get(url);

      if (response.statusCode == 200) {
        NewsScreenModel newsScreenRes = newsScreenModelFromJson(response.body);
        dataList = newsScreenRes.articles ?? [];
        filteredDataList = List.from(dataList); // Initially show all articles
      }
    } catch (e) {
      print("Error fetching news: $e");
    }
    isLoading = false;
    notifyListeners();
  }

  void filterNews(String query) {
    if (query.isEmpty) {
      filteredDataList =
          List.from(dataList); // Show all articles if search is empty
    } else {
      filteredDataList = dataList.where((article) {
        // Check if title, description, or author contains the query (after null check)
        return (article.title != null &&
                article.title!.toLowerCase().contains(query.toLowerCase())) ||
            (article.description != null &&
                article.description!
                    .toLowerCase()
                    .contains(query.toLowerCase())) ||
            (article.author != null &&
                article.author!.toLowerCase().contains(query.toLowerCase()));
      }).toList();
    }
    notifyListeners();
  }
}
