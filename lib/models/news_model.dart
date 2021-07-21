class NewsModel {
  final List<Article> articles;
  NewsModel({required this.articles});

  factory NewsModel.fromJson(Map<String, dynamic> json) {
    if (json['articles'] != null) {
      var list = json['articles'] as List;
      List<Article> articleList =
          list.map((json) => Article.fromJson(json)).toList();
      return NewsModel(articles: articleList);
    }
    return NewsModel(articles: []);
  }
}

class Article {
  final Source source;
  final String author;
  final String title;
  final String description;
  final String newsURL;
  final String imageUrl;
  final String date;
  final String content;
  Article(
      {required this.source,
      required this.author,
      required this.title,
      required this.description,
      required this.newsURL,
      required this.imageUrl,
      required this.date,
      required this.content});

  factory Article.fromJson(Map<String, dynamic> json) {
    if (json['source'] != null) {
      return Article(
          source: Source.fromJson(json['source']),
          author: json["author"],
          title: json["title"],
          description: json["description"],
          newsURL: json["url"],
          imageUrl: json["urlToImage"],
          date: json["publishedAt"],
          content: json["content"]);
    }
    return Article.fromJson(json['source']);
  }
}

class Source {
  final String id;
  final String name;
  Source({required this.id, required this.name});

  factory Source.fromJson(Map<String, dynamic> json) {
    return Source(id: json['id'] as String, name: json['name'] as String);
  }
}

// Every nested JSON item should be done with null safety ! Example: We use null safety for Articles $ Source.
