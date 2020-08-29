import 'package:flutter/material.dart';
import 'package:flutternews/helper/data_category.dart';
import 'package:flutternews/helper/data_request.dart';
import 'package:flutternews/helper/my_widget.dart';

import 'category.dart';
import 'news_page.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  News _news = News();
  List<Category> _categories = List<Category>();

  @override
  void initState() {
    super.initState();
    _categories = getCategory();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff121212),
      appBar: myAppBar(),
      body: SafeArea(
        child: FutureBuilder(
          future: _news.getNews(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return NewsPage(snapshot.data, _categories);
            } else if (snapshot.hasError) {
              print(snapshot.error);
              return Center(child: Text('Data tidak tersedia'));
            }

            return Center(
              child: CircularProgressIndicator(),
            );
          },
        ),
      ),
    );
  }
}
