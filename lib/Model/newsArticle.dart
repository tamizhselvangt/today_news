
class NewsArticle {

  String? title;
  String? description;
  String? urlToImage;
  String? url;
  String? publishedAt;
  String? source;

  NewsArticle({
    this.title,
    this.description,
    this.urlToImage,
    this.url,
    this.publishedAt,
    this.source
  });

  NewsArticle.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    description = json['description'];
    urlToImage = json['urlToImage'];
    url = json['url'];
    publishedAt = json['publishedAt'];
    source = json['source']['name'];
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['title'] = title;
    map['description'] = description;
    map['urlToImage'] = urlToImage;
    map['url'] = url;
    map['publishedAt'] = publishedAt;
    map['source']['name'] = source;
    return map;
  }
}
