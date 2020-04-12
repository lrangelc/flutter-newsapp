import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'package:newsapp/src/models/news_models.dart';

final _URL_NEWS = 'https://newsapi.org/v2';
final _API_KEY = '54aff6782b324aba95563a2ed5ad169a';

class NewsService with ChangeNotifier {
  List<Article> headlines = [];

  NewsService() {
    getTopHeadlines();
  }

  getTopHeadlines() async {
    print('cargando headlines...');
    final url = '$_URL_NEWS/top-headlines?country=ca&apiKey=$_API_KEY';
    final resp = await http.get(url);
    final newsResponse = newsResponseFromJson(resp.body);
    this.headlines.addAll(newsResponse.articles);
    notifyListeners();
  }
}
