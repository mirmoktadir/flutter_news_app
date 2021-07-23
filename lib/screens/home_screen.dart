import 'dart:async';

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
    Future<bool> showExitPopup() async {
      return await showDialog(
            context: context,
            builder: (context) => AlertDialog(
              title: Text('Exit App'),
              content: Text('Do you want to exit an App?'),
              actions: [
                ElevatedButton(
                  onPressed: () => Navigator.of(context).pop(false),
                  child: Text('No'),
                ),
                ElevatedButton(
                  onPressed: () => Navigator.of(context).pop(true),
                  child: Text('Yes'),
                ),
              ],
            ),
          ) ??
          false;
    }

    return WillPopScope(
      onWillPop: showExitPopup,
      child: new Scaffold(
        backgroundColor: Colors.redAccent[50],
        appBar: AppBar(
          backgroundColor: Colors.red,
          centerTitle: true,
          title: Text('Top 20 News'),
          automaticallyImplyLeading: false,
        ),
        body: RefreshIndicator(
          onRefresh: _onRefresh,
          child: FutureBuilder<NewsModel>(
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
        ),
      ),
    );
  }
}

Future<Null> _onRefresh() {
  Completer<Null> completer = new Completer<Null>();
  Timer timer = new Timer(new Duration(seconds: 3), () {
    completer.complete();
  });
  return completer.future;
}
