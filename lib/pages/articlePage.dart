import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:day_today/Components/cNews_article.dart';
import 'package:gap/gap.dart';
import 'package:cloud_firestore/cloud_firestore.dart';


class ArticlePage extends StatelessWidget {
  const ArticlePage({
    super.key,
    required this.title,
    required this.posterUrl,
    required this.description,
    required this.source,
    required this.time,
    required this.url
  });

  final title;
  final posterUrl;
  final source;
  final time;
  final description;
  final url;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Color(0xfff2f7bd),
        backgroundColor: Color(0xffc8ebfd),
        appBar: AppBar(
          leading: IconButton(
            onPressed: (){
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back),
            color: Colors.black,
            iconSize: 28,
          ),
          // backgroundColor: Color(0xfff2f7bd),
          backgroundColor: Color(0xffc8ebfd),
          actions: [
            IconButton(
              onPressed: (){

              },
              icon: const Icon(
                Icons.bookmarks,
                color: Colors.black,
                size: 28,
              ),
            ),
           const SizedBox(width: 30,),
            const Icon(
              Icons.share_outlined,
              color: Colors.black,
              size: 28,
            ),
           const Gap(30),
          ],
        ),
        body: ListView(
          children: [
            Stack(
              children: [
                // Padding(
                //   padding: const EdgeInsets.only(
                //       top: 325),
                //   child: SizedBox(
                //     height: 300,
                //     child: Image.asset(
                //       "assets/images/wave 2.png",
                //       fit: BoxFit.cover,
                //     ),
                //   ),
                // ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [HeadLine()],
                      ),
                      const Gap(20),
                      articleTitle(title),
                      const Gap(30),
                      articlePoster(posterUrl),
                      const Gap(30),
                      articleSource(source),
                      Gap(20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          newsHeadLine(),
                          followBtn(),
                        ],
                      ),
                      const Gap(30),
                      articleContent(description),
                      const Gap(30),
                      openArticleBtn(url, context),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ));
  }
}

