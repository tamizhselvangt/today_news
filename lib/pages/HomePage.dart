import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

// Define a NewsArticle class
class NewsArticle {
  final String title;
  final String imageUrl;

  NewsArticle(this.title, this.imageUrl);

  factory NewsArticle.fromJson(Map<String, dynamic> json) {
    return NewsArticle(json['title'], json['image_url']);
  }
}

// Define a Future<NewsArticle> function to fetch the news article data
Future<NewsArticle> fetchNewsArticle() async {
  final response = await http.get(Uri.parse('https://newsdata.io/api/1/news?apikey=pub_41145d5b3721c3412c43285bcf68a8750e910&country=in&language=en'));
  if (response.statusCode == 200) {
    final jsonBody = jsonDecode(response.body);
    if (jsonBody['status'] == 'success' && jsonBody['results'].isNotEmpty) {
      final jsonArticle = jsonBody['results'][0];
      return NewsArticle.fromJson(jsonArticle);
    } else {
      throw Exception('Failed to load news article');
    }
  } else {
    throw Exception('Failed to load news article');
  }
}

// Define a NewsArticleScreen widget to display the news article data
class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('News Article')),
      body: FutureBuilder<NewsArticle>(
        future: fetchNewsArticle(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.network(snapshot.data!.imageUrl),
                SizedBox(height: 16),
                Text(snapshot.data!.title, style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
              ],
            );
          } else if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          } else {
            return CircularProgressIndicator();
          }
        },
      ),
    );
  }
}