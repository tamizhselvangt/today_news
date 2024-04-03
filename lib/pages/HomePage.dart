import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:today_news/Components/news_preview.dart';
import 'dart:ui' as ui;



// Define a NewsArticleScreen widget to display the news article data
class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffc8ebfd),
      appBar: AppBar(
        title: RichText(
          text: TextSpan(
            text: "",
            style: TextStyle(
              color: Colors.black,
              fontSize: 13,
                fontFamily: "bronice-bold",
            ),
            children: [
              TextSpan( text: "MUN",
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                ),),
              TextSpan(
                text: "",
                style: TextStyle(
                  fontFamily: "bronice-bold"
                )
              ),
              TextSpan(
                text: "WS",
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                ),
              )
              
            ]
          ),
        ),
       actions: [
      Icon(
        Icons.menu,
        size: 30,
        weight: 100,
      ),
         SizedBox(width: 20,)
       ],
        backgroundColor: Color(0xffc8ebfd),
      ),
      body: articlePreviewCard(),
      bottomNavigationBar:  SafeArea(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            GestureDetector(
              onTap: () {
              },
              child: Container(
                height: 50,
                width: 50,
                child: Image.asset(
                  'assets/images/Home_icn.png',
                  color: Colors.black,
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
              },
              child: Container(
                height: 28,
                width: 28,
                child: Image.asset(
                  "assets/images/Search_icn.png",
                  color: Colors.black,
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
              },
              child: Container(
                height: 40,
                width: 40,
                child: Image.asset(
                  "assets/images/Bookmark_icn.png",
                  color: Colors.black,
                ),
              ),
            ), GestureDetector(
              onTap: () {
              },
              child: Container(
                height: 28,
                width: 28,
                child: Image.asset(
                  "assets/images/User_icn_filled.png",
                  color: Colors.black,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}