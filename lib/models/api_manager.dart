import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:top_news/models/news_model.dart';

class APIManager {
  final String url;
  APIManager(this.url);
  Future<NewsModel> getNews() async {
    var newsModel;

    try {
      http.Response response = await http.get(
        Uri.parse(url),
      );
      if (response.statusCode == 200) {
        String data = response.body;
        var jsonData = jsonDecode(data);
        newsModel = NewsModel.fromJson(jsonData);
        return newsModel;
      }
    } catch (e) {
      return newsModel;
    }
    return newsModel;
  }
}
