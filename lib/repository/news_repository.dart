import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:news_case3/models/article_model.dart';

class NewsRepository {
  Future<List<ArticleModel>> fetchNews() async {
    var response = await http.get(Uri.parse(
        "https://newsapi.org/v2/top-headlines?country=us&apiKey=ab3b6086568c4c00ad6c843bf2aa2cf5"));

    var data = jsonDecode(response.body);

    List<ArticleModel> _articleModelList = [];

    if (response.statusCode == 200) {
      for (var item in data["articles"]) {
        ArticleModel _articleModel = ArticleModel.fromJson(item);
        _articleModelList.add(_articleModel);
      }
      return _articleModelList;
    } else {
      return _articleModelList;
    }
  }
}
