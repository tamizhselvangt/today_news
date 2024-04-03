import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:today_news/utilities/fetchNews.dart';





FutureBuilder<List<NewsArticle>> articlePreviewCard(){
  return FutureBuilder<List<NewsArticle>>(
    future: fetchNewsArticle(),
    builder: (BuildContext context, AsyncSnapshot<List<NewsArticle>> snapshot) {
      if (snapshot.hasData) {
        return ListView.builder(
            itemCount: snapshot.data!.length,
            itemBuilder: (context, index) {
            final article = snapshot.data![index];
            if (article.description == null || article.description!.isEmpty) return Container();
            if (article.urlToImage == null || article.description!.isEmpty) return Container();
             return Container(
                color: Color(0xff0c7c0fa),
                height: 530,
                width: double.infinity,
                child: Padding(
                  padding: EdgeInsets.fromLTRB(15,20,10,0),
                  child: Column(
                    children: [
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Stack(
                          children: [
                            Positioned(
                              bottom: 0,
                              left: 0,
                              right: 0,
                              child: Container(
                                height: 2,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            Positioned(
                              bottom: 0.5,
                              left: 0,
                              right: 0,
                              child: Container(
                                height: 14,
                                decoration: BoxDecoration(
                                  color: Color(0xff99f4c6),
                                ),
                              ),
                            ),
                            Text(
                              "HEADLINE",
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w600,
                                  fontFamily: 'Mono sans'
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      articlePreviewTitle(article.title!),
                      SizedBox(
                        height: 30,
                      ),
                      previewPoster(article.urlToImage!),
                      SizedBox(height: 20,),
                      articlePrevieDescription(article.description!),
                      SizedBox(height: 20,),
                      articleBottomIcons(),
                      SizedBox(height: 10,),
                      Divider(
                        color: Colors.black26,
                        thickness: 1,
                        height: 10,
                      )
                    ],
                  ),
                ),
              );
            },
        );
      } else if (snapshot.hasError) {
        return Text('Error: ${snapshot.error}');
      } else {
        return CircularProgressIndicator();
      }
    },
  );
}

Widget articlePreviewTitle(String title){
  final desc = title.replaceAll("'", "\'").replaceAll(RegExp(r'[\u2018\u2019\u201C\u201D]'), "\'");
  final words = desc.split(' ');
  final first10Words = words.take(15).join(' ');
  return RichText(
    text: TextSpan(
      text: first10Words,
      style:TextStyle(
        color: Colors.black,
        fontWeight: FontWeight.bold,
        fontSize: 20,
        fontFamily: 'Chomsky'
    ),
      children: [
        TextSpan(
          text: "...",
          style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 25,
              fontFamily: 'Mono sans'
          ),
        )
      ]
  ),
  );
}

Widget articlePrevieDescription(String description){
  final desc = description.replaceAll(RegExp(r'[\u2018\u2019\u201C\u201D]'), "\'");
  final words = desc.split(' ');
  final first20Words = words.take(20).join(' ');
  return Container(
    height: 60,
    child: RichText(
      text: TextSpan(
        text: "${first20Words}",
        style: TextStyle(color: Colors.black,
        fontFamily: "Chomsky"),
        children: [
          TextSpan(
            text: '...More!',
            style: TextStyle(
                color: Colors.black,
                fontSize: 18,
                fontFamily: "Chomsky",
                fontWeight: FontWeight.bold),
          ),
        ],
      ),
    ),
  );
}

Widget articleBottomIcons(){
  return Container(
    height: 20,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Icon(Icons.favorite_border_outlined,
              size: 25,),

            SizedBox(width: 30,),
            Icon(Icons.volume_up_outlined,size: 25,),
          ],
        ),
        Row(
          children: [
            Icon(Icons.access_time),

            Text(" 17 houres ago",
              style: TextStyle(
                  fontSize: 18,
                  color: Colors.black45
              ),)
          ],
        )
      ],
    ),
  );
}


Widget previewPoster(String url){
  return
    Stack(
      children: [
        Container(
          padding: EdgeInsets.fromLTRB(10,10,0,0),
          child: Container(
            width: 350,
            height: 180,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black, width: 2.3),
              borderRadius: BorderRadius.circular(0.0),
            ),
          ),
        ),
        Container(
          child: ClipRect(
            child: Image.network(url, fit: BoxFit.cover,),
            ),
          width: 350,
          height: 180,
        ),
        // Positioned(
        //   left: 70,
        //   // top: 20,
        //   child: Container(
        //     width: 180,
        //     height: 180,
        //     child: FittedBox(
        //       fit: BoxFit.cover,
        //       child: Image.network(url),
        //     ),
        //   ),
        // ),
        Positioned(
            left: 300,
            top: 150,
            child: Icon(Icons.camera_alt_outlined,
              size: 30,
              color: Colors.white70,)
        )
      ],
    );
}