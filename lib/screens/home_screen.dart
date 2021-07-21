import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:top_news/components/news_card.dart';
import 'package:top_news/constants/constants.dart';
import 'package:top_news/models/api_manager.dart';
import 'package:top_news/models/news_model.dart';

class HomeScreen extends StatefulWidget {
  static const String id = 'HomeScreen';

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late Future<NewsModel> newsModel;
  @override
  void initState() {
    newsModel = APIManager(Constants.newsUrl).getNews();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.redAccent[50],
      appBar: AppBar(
        backgroundColor: Colors.red,
        centerTitle: true,
        title: Text('Top News'),
      ),
      body: FutureBuilder<NewsModel>(
        future: newsModel,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data!.articles.length,
              itemBuilder: (context, index) {
                var article = snapshot.data!.articles[index];
                return NewsCard(article: article);
              },
            );
          } else
            return Center(
              child: CircularProgressIndicator(),
            );
        },
      ),
    );
  }
}
