import 'package:flutter/cupertino.dart';
import 'package:solusi_digital_flutter_test/model/news.dart';
import 'package:solusi_digital_flutter_test/model/news_repository.dart';

class NewsViewModel extends ChangeNotifier {
  List<News> _newsList = [];

  void setNewsList(List<News> newsList) {
    _newsList = newsList;
    notifyListeners();
  }

  List<News> get newsList => _newsList;

  Future<List<News>> getNews() async {
    final news = await NewsRepository.fetchNews();
    setNewsList(news);
    return news;
  }
}