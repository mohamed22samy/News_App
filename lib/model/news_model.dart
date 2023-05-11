// To parse this JSON data, do
//
//     final articles = articlesFromJson(jsonString);

import 'dart:convert';

Articles articlesFromJson(String str) => Articles.fromJson(json.decode(str));

String articlesToJson(Articles data) => json.encode(data.toJson());

class Articles {
  String status;
  int totalResults;
  List<Article> articles;

  Articles({
    this.status,
    this.totalResults,
    this.articles,
  });

  factory Articles.fromJson(Map<String, dynamic> json) => Articles(
        status: json["status"],
        totalResults: json["totalResults"],
        articles: List<Article>.from(
            json["articles"].map((x) => Article.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "totalResults": totalResults,
        "articles": List<dynamic>.from(articles.map((x) => x.toJson())),
      };
}

class Article {
  Source source;
  String author;
  String title;
  dynamic description;
  String url;
  dynamic urlToImage;
  DateTime publishedAt;
  dynamic content;

  Article({
    this.source,
    this.author,
    this.title,
    this.description,
    this.url,
    this.urlToImage,
    this.publishedAt,
    this.content,
  });

  factory Article.fromJson(Map<String, dynamic> json) => Article(
        source: Source.fromJson(json["source"]),
        author: json["author"],
        title: json["title"],
        description: json["description"] ?? "Api اسف يتعزر وجود وصف بسبب ",//يرجع الرساله دي لو لا يرجع الحاجه المطلوبه null لو بيساوي 
        url: json["url"],
        urlToImage: json["urlToImage"] ?? "http://akhbareddar.tunisiatv.tn/sites/default/files/article-images/%D9%86%D8%B4%D8%B1%D8%A9%20%D8%A7%D9%84%D8%A7%D8%AE%D8%A8%D8%A7%D8%B1%202.jpg",
        publishedAt: DateTime.parse(json["publishedAt"]),
        content: json["content"],
      );

  Map<String, dynamic> toJson() => {
        "source": source.toJson(),
        "author": author,
        "title": title,
        "description": description,
        "url": url,
        "urlToImage": urlToImage ?? "http://akhbareddar.tunisiatv.tn/sites/default/files/article-images/%D9%86%D8%B4%D8%B1%D8%A9%20%D8%A7%D9%84%D8%A7%D8%AE%D8%A8%D8%A7%D8%B1%202.jpg",
        "publishedAt": publishedAt.toIso8601String(),
        "content": content,
      };
}

class Source {
  Id id;
  Name name;

  Source({
    this.id,
    this.name,
  });

  factory Source.fromJson(Map<String, dynamic> json) => Source(
        id: idValues.map[json["id"]],
        name: nameValues.map[json["name"]],
      );

  Map<String, dynamic> toJson() => {
        "id": idValues.reverse[id],
        "name": nameValues.reverse[name],
      };
}

// ignore: constant_identifier_names
enum Id { GOOGLE_NEWS }

final idValues = EnumValues({"google-news": Id.GOOGLE_NEWS});

// ignore: constant_identifier_names
enum Name { GOOGLE_NEWS }

final nameValues = EnumValues({"Google News": Name.GOOGLE_NEWS});

class EnumValues<T> {
  Map<String, T> map;
  Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
