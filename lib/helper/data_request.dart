import 'dart:convert';

import 'package:flutternews/models/ResponBerita.dart';
import 'package:http/http.dart' as http;

String _kApiKey = 'd925af6e5aa0446584c99d799f741e03';

class News {
  Future<ResponBerita> getNews() async {
    String url = 'https://newsapi.org/'
        'v2/top-headlines'
        '?country=id&apiKey=$_kApiKey';

    var response = await http.get(url);
    var jsonData = jsonDecode(response.body);
    return ResponBerita.fromJsonMap(jsonData);
  }
}

class RequestByCategory {
  Future<ResponBerita> getNewsByCategory(String categry) async {
    String url = 'https://newsapi.org/'
        'v2/top-headlines?country=id&category=$_kApiKey';

    var response = await http.get(url);
    var jsonData = jsonDecode(response.body);
    return ResponBerita.fromJsonMap(jsonData);
  }
}
