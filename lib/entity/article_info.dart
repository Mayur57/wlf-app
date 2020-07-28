import 'dart:convert';

Articles articlesFromJson(String str) => Articles.fromJson(json.decode(str));

String articlesToJson(Articles data) => json.encode(data.toJson());

class Articles {
  Articles({
    this.article,
    this.articleId,
    this.author,
    this.imageUrl,
    this.title,
  });

  String article;
  int articleId;
  String author;
  String imageUrl;
  String title;

  factory Articles.fromJson(Map<String, dynamic> json) => Articles(
    article: json["article"],
    articleId: json["article_id"],
    author: json["author"],
    imageUrl: json["image_url"],
    title: json["title"],
  );

  Map<String, dynamic> toJson() => {
    "article": article,
    "article_id": articleId,
    "author": author,
    "image_url": imageUrl,
    "title": title,
  };
}

