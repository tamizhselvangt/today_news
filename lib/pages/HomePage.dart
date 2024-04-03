import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:today_news/Components/news_preview.dart';




// Define a NewsArticleScreen widget to display the news article data
class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('News Article')),
      body: articlePreviewCard(),
      bottomNavigationBar:  SafeArea(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            IconButton(onPressed: (){}, icon: Icon(Icons.home_filled)),
            IconButton(onPressed: (){}, icon: Icon(Icons.search_outlined)),
            IconButton(onPressed: (){}, icon: Icon(Icons.bookmark_border_outlined)),
            IconButton(onPressed: (){}, icon: Icon(Icons.person_off_rounded))
          ],
        ),
      ),
    );
  }
}