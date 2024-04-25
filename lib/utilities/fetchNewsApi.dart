import 'dart:convert';
import 'package:http/http.dart' as http;

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


// Define a Future<NewsArticle> function to fetch the news article data
Future<List<NewsArticle>> fetchNewsArticle(String searchQuery) async {

  final apiKey ="9fcf5998c99d4970a364d0a28c0beb04";
  // final apiKey = "b81871b6349f459db5962a1ee3d9976c";

  final url = "https://newsapi.org/v2/everything?q=$searchQuery&sortBy=popularity&apiKey=${apiKey}";
  final response = await http.get(Uri.parse(url));
  if (response.statusCode == 200) {
    final jsonBody = jsonDecode(response.body);
    if (jsonBody['status'] == 'ok' && jsonBody['articles'].isNotEmpty) {
      final data = jsonBody['articles'] as List<dynamic>;
      return data.map((json) => NewsArticle.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load news article');
    }
  } else {
    throw Exception('Failed to load news article');
  }
}