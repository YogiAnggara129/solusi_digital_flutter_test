import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:solusi_digital_flutter_test/model/news.dart';

class NewsRepository {
  static Future<List<News>> fetchNews() async {
    List<News> _newsFromJson(String str) =>
        List<News>.from(json.decode(str)['articles'].map((x) => News.fromJson(x)));

    final response = await http.get(Uri.parse('https://newsapi.org/v2/top-headlines?category=health&country=id&apiKey=d279cdbc7f534735b76c1f3b9a5e324c'));
    if (response.statusCode == 200) {
      return _newsFromJson(response.body);
    } else {
      throw Exception('Failed to load data');
    }
  }
}
