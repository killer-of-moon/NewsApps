import 'package:flutter/material.dart';
import 'package:flutternews/helper/data_request.dart';

import 'helper/my_widget.dart';
import 'models/ResponBerita.dart';
import 'news_item.dart';

class NewsByCategory extends StatefulWidget {
  @override
  _NewsByCategoryState createState() => _NewsByCategoryState(_newsCategory);
  String _newsCategory;

  NewsByCategory(this._newsCategory);
}

class _NewsByCategoryState extends State<NewsByCategory> {
  RequestByCategory _requestByCategory = RequestByCategory();
  String _categoryName;

  _NewsByCategoryState(this._categoryName);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfff121212),
      appBar: myAppBar(),
      body: FutureBuilder(
        future: _requestByCategory.getNewsByCategory(_categoryName),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListNewsCategory(snapshot.data);
          } else if (snapshot.hasError) {
            return Center(child: Text('Data tidak tersedia'));
          }

          return Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}

class ListNewsCategory extends StatelessWidget {
  ResponBerita _responBerita;

  ListNewsCategory(this._responBerita);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Container(
            margin: EdgeInsets.only(top: 16),
            child: ListView.builder(
                itemCount: _responBerita.articles.length,
                shrinkWrap: true,
                physics: ClampingScrollPhysics(),
                itemBuilder: (context, index) {
                  String imageUrl =
                      _responBerita.articles[index].urlToImage ?? '';
                  String title = _responBerita.articles[index].title ?? '';
                  String description =
                      _responBerita.articles[index].description ?? '';
                  String content = _responBerita.articles[index].content ?? '';
                  String url = _responBerita.articles[index].url ?? '';
                  String source =
                      _responBerita.articles[index].source.name ?? '';
                  return NewsItem(
                      imageUrl, title, description, content, url, source);
                })));
  }
}
