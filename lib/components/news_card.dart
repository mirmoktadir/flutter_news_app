import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:top_news/models/news_model.dart';
import 'package:top_news/screens/news_view_screen.dart';

class NewsCard extends StatelessWidget {
  NewsCard({
    required this.article,
  });

  final Article article;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 5),
      child: GestureDetector(
        onTap: () async {
          await Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => NewsViewScreen(
                date: article.date,
                imageUrl: article.imageUrl,
                title: article.title,
                description: article.description,
              ),
            ),
          );
        },
        child: Container(
          color: Colors.grey[100],
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                height: 150,
                width: 110,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(article.imageUrl),
                    fit: BoxFit.cover,
                  ),
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(35),
                    bottomLeft: Radius.circular(35),
                    // bottomLeft: Radius.circular(30),
                  ),
                ),
              ),
              SizedBox(
                width: 15,
              ),
              Flexible(
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: 150,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        article.title,
                        maxLines: 3,
                        style: TextStyle(
                          color: Colors.red[400],
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      Expanded(
                        child: Text(
                          article.description,
                          maxLines: 2,
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.grey[800],
                            fontWeight: FontWeight.w500,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
