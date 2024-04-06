// import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
import 'package:today_news/Components/cNews_preview.dart';
// import 'dart:ui' as ui;
import 'articlePage.dart';
import 'package:get/get.dart';
import "package:today_news/constants/constants.dart";

// Define a NewsArticleScreen widget to display the news article data
class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool selectedHome = false;
  bool selectedTech = false;
  bool selectedPolitics = false;
  bool selectedCrypto = false;
  bool selectedMarket = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffE1CDFF),
      appBar: AppBar(
        title: RichText(
          text: TextSpan(
            text: "DAY TODAY",
            style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 25,
                letterSpacing: 0,
                fontFamily: "PolySans"),
          ),
        ),
        actions: [
          Icon(
            Icons.menu,
            size: 30,
            weight: 100,
          ),
          SizedBox(
            width: 20,
          )
        ],
        backgroundColor: Color(0xffE1CDFF),
      ),
      body: Column(
        children: [
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Container(
              height: 50,
              decoration: BoxDecoration(
                  border: Border(
                top: BorderSide(width: 0.3, color: Colors.black54),
                bottom: BorderSide(width: 0.2, color: Colors.black),
              )),
              child: StatefulBuilder(builder: (context, setState) {


                return Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15.0),
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            selectedHome = true;
                            selectedTech = false;
                            selectedPolitics = false;
                            selectedCrypto = false;
                            selectedMarket = false;
                          });
                        },
                        child: Text(
                          "HOME",
                          style: selectedHome
                              ? kTopBarSelectedTitle
                              : kTopBarTitle,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15.0),
                      child: GestureDetector(
                        onTap: () {
                          print(selectedMarket);
                          setState(() {
                            selectedHome = false;
                            selectedTech = true;
                            selectedPolitics = false;
                            selectedCrypto = false;
                            selectedMarket = false;
                          });
                        },
                        child: Text(
                          "TECH",
                          style: selectedTech
                              ? kTopBarSelectedTitle
                              : kTopBarTitle,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15.0),
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            selectedHome = false;
                            selectedTech = false;
                            selectedPolitics = true;
                            selectedCrypto = false;
                            selectedMarket = false;
                          });
                        },
                        child: Text(
                          "POLITICS",
                          style: selectedPolitics
                              ? kTopBarSelectedTitle
                              : kTopBarTitle,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15.0),
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            selectedHome = false;
                            selectedTech = false;
                            selectedPolitics = false;
                            selectedCrypto = true;
                            selectedMarket = false;
                          });
                        },
                        child: Text(
                          "CRYPTO",
                          style: selectedCrypto
                              ? kTopBarSelectedTitle
                              : kTopBarTitle,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15.0),
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            selectedHome = false;
                            selectedTech = false;
                            selectedPolitics = false;
                            selectedCrypto = false;
                            selectedMarket = true;
                          });
                        },
                        child: Text(
                          "MARKET",
                          style: selectedMarket
                              ? kTopBarSelectedTitle
                              : kTopBarTitle,
                        ),
                      ),
                    ),
                  ],
                );
              }),
            ),
          ),
          articlePreviewCard(),
        ],
      ),
      bottomNavigationBar: SafeArea(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            GestureDetector(
              onTap: () {},
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
              onTap: () {},
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
              onTap: () {},
              child: Container(
                height: 40,
                width: 40,
                child: Image.asset(
                  "assets/images/Bookmark_icn.png",
                  color: Colors.black,
                ),
              ),
            ),
            GestureDetector(
              onTap: () {},
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
