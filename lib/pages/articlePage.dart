import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:today_news/Components/cNews_article.dart';
import 'package:gap/gap.dart';

class ArticlePage extends StatelessWidget {
  const ArticlePage({super.key,required this.title,required this.posterUrl });
  final title;
  final posterUrl;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Color(0xfff2f7bd),
        backgroundColor: Color(0xffc8ebfd),
        appBar: AppBar(
          leading: IconButton(
            onPressed: (){
              Get.back();
            },
            icon: Icon(Icons.arrow_back),
            color: Colors.black,
            iconSize: 28,
          ),
          // backgroundColor: Color(0xfff2f7bd),
          backgroundColor: Color(0xffc8ebfd),
          actions: [
            Icon(
              Icons.bookmarks,
              color: Colors.black,
              size: 28,
            ),
            SizedBox(
              width: 30,
            ),
            Icon(
              Icons.share_outlined,
              color: Colors.black,
              size: 28,
            ),
            SizedBox(
              width: 30,
            ),
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
                        children: [HeadLine(), followBtn()],
                      ),
                      const Gap(20),
                      articleTitle(title),
                      const Gap(30),
                      articlePoster(posterUrl),
                      const Gap(30),
                      newsHeadLine(),
                      const Gap(30),
                      articleContent(),
                      const Gap(30),
                      openArticleBtn(),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ));
  }
}

